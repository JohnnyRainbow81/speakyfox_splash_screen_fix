// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/app/environment.dart';
import 'package:speakyfox/data/requests/authentication_body.dart';
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
  IdentityToken? _credentials; //gets populated by accessToken-flow

  final AuthenticationRepository _authenticationRepository;

  AuthenticationService(
    this._authenticationRepository,
  );

  IdentityToken? get credentials {
    //check if valid here?
    return _credentials;
  }

  set setCredentials(IdentityToken token) {
    _credentials = token;
  }

  Future<bool> login(String username, String password) async {
    Ticket ticket = await _authenticationRepository.accessToken(
        AuthenticationRequestBody(userName: username, password: password, grantType: GrantType.password.name));
    User me = await _authenticationRepository.fetchUser("Bearer ${ticket.accessToken}");

    IdentityToken identityToken = IdentityToken(
        expires: _calculateExpirationDate(
            ticket.expiresIn), //DateTime.tryParse(ticket.expiresIn.toString())!.toIso8601String(),
        accessToken: ticket.accessToken,
        refreshToken: ticket.refreshToken!,
        user: me);

    _authenticationRepository.saveCredentials(identityToken);
    _credentials = identityToken;

    //DI for authenticated HTTP calls
    await initializeDependencies(ticket.accessToken);

    return true;
  }

  String _calculateExpirationDate(int expiresIn) {
    return DateTime.now().add(Duration(seconds: expiresIn)).toIso8601String();
  }

  bool isExpired() {
    DateTime expirationTime = DateTime.parse(_credentials!.expires);
    if (expirationTime.isBefore(DateTime.now())) return true;
    return false;
  }

  Future<String?> tryInitializingAuthenticationFromCache() async {
    //check if valid credentials are already set in authenticationService
    bool hasValidCredentials = _credentials != null && _credentials?.user != null && !isExpired();

    if (hasValidCredentials == true) {
      return _credentials!.accessToken;
    } else {
      //try to load any from local cache
      IdentityToken? identityToken = await _authenticationRepository.loadCredentials();
      if (identityToken != null) {
        _credentials = identityToken;
        return !isExpired() ? identityToken.accessToken : null;
      }
    }
    return null; //No valid authToken so return null
  }

  bool isAuthenticated() {
    return _credentials != null && _credentials?.user != null && !isExpired();
  }

  Future<bool> sendPasswordResetEmail(SendPasswordResetBody body) async {
    final bool success = await _authenticationRepository.sendPasswordResetEmail(body);
    return success;
  }

  Future<bool> resetPassword(String userId, ResetPasswordBody body) async {
    final bool success = await _authenticationRepository.resetPassword(userId, body);
    //TODO response correct? do sth with it?
    return success;
  }

  bool hasRole(String group) {
    List<Role> roles = _credentials?.user.roles ?? [];

    if (roles.isEmpty) return false;
    if (group.isEmpty) return true;
    if (env.production && roles.contains(Role.Developer)) return true;
    if (roles.isNotEmpty) {
      if (roles.contains(Role.SystemAdministrator) || roles.contains(Role.Administrator)) return true;
    }
    return roles.any((role) => role.name == group);
  }

  bool hasAnyRole(List<String> groups) {
    List<Role> roles = _credentials?.user.roles ?? [];

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
    List<Role> roles = _credentials?.user.roles ?? [];

    if (roles.isEmpty) return false;
    if (!env.production) {
      if (roles.contains(Role.Developer)) return true;
    }
    return (roles.contains(Role.SystemAdministrator) || roles.contains(Role.Administrator));
  }

  bool isCMSUser() {
    List<Role> roles = _credentials?.user.roles ?? [];

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
    Ticket ticket = await _authenticationRepository.refreshToken(
        RefreshTokenBody(refreshToken: _credentials!.refreshToken, grantType: GrantType.refresh_token.name));
    IdentityToken identityToken = IdentityToken(
        expires: _calculateExpirationDate(ticket.expiresIn),
        accessToken: ticket.accessToken,
        refreshToken: _credentials!.refreshToken,
        user: _credentials!.user);

    _authenticationRepository.saveCredentials(identityToken);
    _credentials = identityToken;
  }

  Future<bool> validateToken(String userId, String token) {
    return _authenticationRepository.validateToken(userId, token);
  }
}
