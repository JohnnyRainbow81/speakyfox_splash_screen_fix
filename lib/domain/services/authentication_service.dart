// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
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
  int _expirationTimestamp = -1;

  IdentityToken? _credentials; //gets populated by accessToken-flow

  final AuthenticationRepository _authenticationRepository;

  AuthenticationService(
    this._authenticationRepository,
  );

  IdentityToken? get credentials {
    //check if valid here?
    return _credentials;
  }

  Future<bool> login(String username, String password) async {
    Ticket ticket = await _authenticationRepository.accessToken(
        AuthenticationRequestBody(userName: username, password: password, grantType: GrantType.refresh_token.name));
    User me = await _authenticationRepository.fetchUser("Bearer ${ticket.accessToken}");

    IdentityToken identityToken = IdentityToken(
        expires: ticket.expiresIn, accessToken: ticket.accessToken, refreshToken: ticket.refreshToken!, user: me);

    _credentials = identityToken;
    _expirationTimestamp = (DateTime.now().millisecondsSinceEpoch / 1000).floor() + ticket.expiresIn;

    return true;
  }

  bool isExpired() {
    if (_expirationTimestamp < 0) return true;
    if (_expirationTimestamp < DateTime.now().millisecondsSinceEpoch) return true;
    return false;
  }

  bool isAuthenticated() {
    return _credentials != null && _credentials?.user != null;
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
    if (env.production && roles.contains(Role.developer)) return true;
    if (roles.isNotEmpty) {
      if (roles.contains(Role.systemAdministrator) || roles.contains(Role.administrator)) return true;
    }
    return roles.any((role) => role.name == group);
  }

  bool hasAnyRole(List<String> groups) {
    List<Role> roles = _credentials?.user.roles ?? [];

    if (roles.isEmpty) return false;
    if (groups.isEmpty) return true; //FIXME really?
    if (!env.production) {
      if (roles.contains(Role.developer)) return true;
    }
    if (roles.isNotEmpty) {
      if (roles.contains(Role.systemAdministrator) || roles.contains(Role.administrator)) return true;
    }
    //Check if any role in roles == any group in groups
    return roles.any((role) => groups.any((group) => role.name == group));
  }

  bool isAdministrator() {
    List<Role> roles = _credentials?.user.roles ?? [];

    if (roles.isEmpty) return false;
    if (!env.production) {
      if (roles.contains(Role.developer)) return true;
    }
    return (roles.contains(Role.systemAdministrator) || roles.contains(Role.administrator));
  }

  bool isCMSUser() {
    List<Role> roles = _credentials?.user.roles ?? [];

    if (roles.isEmpty) return false;
    if (!env.production) {
      if (roles.contains(Role.developer)) return true;
    }
    return (roles.contains(Role.systemAdministrator) ||
        roles.contains(Role.administrator) ||
        roles.contains(Role.creator) ||
        roles.contains(Role.contentManager) ||
        roles.contains(Role.contentAssistent) ||
        roles.contains(Role.marketingManager) ||
        roles.contains(Role.marketingAssistent));
  }

  Future<void> refreshToken() async {
    Ticket ticket = await _authenticationRepository.refreshToken(
        RefreshTokenBody(refreshToken: _credentials!.refreshToken, grantType: GrantType.refresh_token.name));
    IdentityToken identityToken = IdentityToken(
        expires: ticket.expiresIn,
        accessToken: ticket.accessToken,
        refreshToken: _credentials!.refreshToken,
        user: _credentials!.user);
    _credentials = identityToken;
  }
}
