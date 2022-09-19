// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/app/environment.dart';
import 'package:speakyfox/data/requests/authentication_body.dart';
import 'package:speakyfox/data/requests/create_user_request.dart';
import 'package:speakyfox/data/requests/refresh_token_body.dart';
import 'package:speakyfox/data/requests/reset_password_body.dart';
import 'package:speakyfox/data/requests/send_password_reset_body.dart';
import 'package:speakyfox/domain/models/identity_token.dart';
import 'package:speakyfox/domain/models/role.dart';
import 'package:speakyfox/domain/models/ticket.dart';
import 'package:speakyfox/domain/models/user.dart';
import 'package:speakyfox/domain/repositories/authentication_repository.dart';

enum GrantType {
  @JsonValue("password")
  password,
  @JsonValue("refresh_token")
  refresh_token
}

//Only class to communicate with Auth Server
class AuthenticationService {
  //IdentityToken? _credentials; //gets populated by accessToken-flow

  final AuthenticationRepository _authenticationRepository;

  AuthenticationService(
    this._authenticationRepository,
  );

  IdentityToken? getCredentials() {
    return _authenticationRepository.loadCredentials();
  }

  Future<bool> setCredentials(IdentityToken token) {
    return _authenticationRepository.saveCredentials(token);
  }

  Future<bool> clearCredentials() {
    return _authenticationRepository.clearCredentials();
  }

  User? getUser() {
    //returns User if saved locally
    return _authenticationRepository.loadUser();
  }

  Future<bool> register(CreateProfileUserRequest user) async {
    await _authenticationRepository.register(user);
    return true;
  }

  Future<bool?> login(String username, String password, bool stayLoggedIn) async {
    Ticket ticket = await _authenticationRepository.accessToken(
        AuthenticationRequestBody(userName: username, password: password, grantType: GrantType.password.name));
    User me = await _authenticationRepository.fetchUser("Bearer ${ticket.accessToken}");

    IdentityToken identityToken = IdentityToken(
        expires: _calculateExpirationDate(
            ticket.expiresIn), //DateTime.tryParse(ticket.expiresIn.toString())!.toIso8601String(),
        accessToken: ticket.accessToken,
        refreshToken: ticket.refreshToken!,
        user: me);

    if (stayLoggedIn) {
      setCredentials(identityToken);
    }

    //DI for authenticated HTTP calls
    //await initializeDependencies(ticket.accessToken);

    return true;
  }

  String _calculateExpirationDate(int expiresIn) {
    return DateTime.now().add(Duration(seconds: expiresIn)).toIso8601String();
  }

  bool isExpired(IdentityToken credentials) {
    DateTime expirationTime = DateTime.parse(credentials.expires);
    if (expirationTime.isBefore(DateTime.now())) return true;
    return false;
  }

  bool isAuthenticated() {
    IdentityToken? credentials = getCredentials();

    return credentials != null && !isExpired(credentials);
  }

  Future<bool?> sendPasswordResetEmail(SendPasswordResetBody body) async {
    final bool success = await _authenticationRepository.sendPasswordResetEmail(body);
    return success;
  }

  Future<bool> resetPassword(String userId, ResetPasswordBody body) async {
    final bool success = await _authenticationRepository.resetPassword(userId, body);
    //TODO response correct? do sth with it?
    return success;
  }

  bool hasRole(String group) {
    IdentityToken? credentials = getCredentials();

    List<Role> roles = credentials?.user.roles ?? [];

    if (roles.isEmpty) return false;
    if (group.isEmpty) return true;
    if (env.production && roles.contains(Role.Developer)) return true;
    if (roles.isNotEmpty) {
      if (roles.contains(Role.SystemAdministrator) || roles.contains(Role.Administrator)) return true;
    }
    return roles.any((role) => role.name == group);
  }

  bool hasAnyRole(List<String> groups) {
    IdentityToken? credentials = getCredentials();

    List<Role> roles = credentials?.user.roles ?? [];

    if (roles.isEmpty) return false;
    if (groups.isEmpty) return true; //FIXME really?
    if (!env.production) {
      if (roles.contains(Role.Developer)) return true;
    }
    if (roles.isNotEmpty) {
      if (roles.contains(Role.SystemAdministrator) || roles.contains(Role.Administrator)) return true;
    }
    //Check if any role in roles == any group in groups
    return roles.any((role) => groups.any((group) => role.name == group));
  }

  bool isAdministrator() {
    IdentityToken? credentials = getCredentials();

    List<Role> roles = credentials?.user.roles ?? [];

    if (roles.isEmpty) return false;
    if (!env.production) {
      if (roles.contains(Role.Developer)) return true;
    }
    return (roles.contains(Role.SystemAdministrator) || roles.contains(Role.Administrator));
  }

  bool isCMSUser() {
    IdentityToken? credentials = getCredentials();

    List<Role> roles = credentials?.user.roles ?? [];

    if (roles.isEmpty) return false;
    if (!env.production) {
      if (roles.contains(Role.Developer)) return true;
    }
    return (roles.contains(Role.SystemAdministrator) ||
        roles.contains(Role.Administrator) ||
        roles.contains(Role.Creator) ||
        roles.contains(Role.ContentManager) ||
        roles.contains(Role.ContentAssistent) ||
        roles.contains(Role.MarketingManager) ||
        roles.contains(Role.MarketingAssistent));
  }

  Future<void> refreshToken() async {
    IdentityToken? credentials = getCredentials();

    Ticket ticket = await _authenticationRepository.refreshToken(
        RefreshTokenBody(refreshToken: credentials!.refreshToken, grantType: GrantType.refresh_token.name));
    IdentityToken identityToken = IdentityToken(
        expires: _calculateExpirationDate(ticket.expiresIn),
        accessToken: ticket.accessToken,
        refreshToken: credentials.refreshToken,
        user: credentials.user);

    setCredentials(identityToken);
  }

  //See "TokenService" in SpeakyFox WebApp. Not sure if needed..
  Future<bool> validateToken(String userId, String token) {
    return _authenticationRepository.validateToken(userId, token);
  }

  Future<bool> logout() async {
    //clear credentials here?
    return await _authenticationRepository.clearCredentials();
  }
}
