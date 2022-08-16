// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/app/environment.dart';
import 'package:speakyfox/domain/models/identity_token.dart';
import 'package:speakyfox/domain/models/role.dart';
import 'package:speakyfox/domain/models/ticket.dart';
import 'package:speakyfox/domain/models/user.dart';
import 'package:speakyfox/domain/repositories/authentication_repository.dart';

enum GrantType { password, refresh_token }

//Only class to communicate with Auth Server
class AuthenticationService {
  int _expirationTimestamp = -1;
  late User _me;

  late IdentityToken _credentials; //gets populated by accessToken-flow

  final AuthenticationRepository _authenticationRepository;

  AuthenticationService(
    this._authenticationRepository,
  );

  String get accessToken {
    //check if valid here?
    return _credentials.accessToken;
  }

  Future<bool> login(String username, String password) async {
    Ticket ticket = await _authenticationRepository.accessToken(username, password, GrantType.refresh_token.name);
    User me = await _authenticationRepository.fetchMe(ticket.accessToken);
    IdentityToken identityToken =
        IdentityToken(expires: ticket.expiresIn, accessToken: accessToken, refreshToken: ticket.refreshToken, user: me);
    _me = me;
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
    throw UnimplementedError();
  }

  Future<bool> sendPasswordResetEmail(String email) async {
   throw UnimplementedError();
  }

  Future<bool> resetPassword()

TODO
export class AccessTokenRequestBody {
  email: string;
  password: string;
}

export class AccessTokenResponse {
  access_token: string;
  expires: string;
  refresh_token: string;
}

export class SendPasswordResetBody {
  email: string;
}

export class ResetPasswordBody {
  password: string;
  token: string;
}

  bool hasRole(String group) {
    if (group.isEmpty) return true;
    if (env.production && _me.roles.contains(Role.developer)) return true;
    if (_me.roles.isNotEmpty) {
      if (_me.roles.contains(Role.systemAdministrator) || _me.roles.contains(Role.administrator)) return true;
    }
    return _me.roles.any((role) => role.name == group);
  }

  bool hasAnyRole(List<String> groups) {
    if (groups.isEmpty) return true; //FIXME really?
    if (!env.production) {
      if (_me.roles.contains(Role.developer)) return true;
    }
    if (_me.roles.isNotEmpty) {
      if (_me.roles.contains(Role.systemAdministrator) || _me.roles.contains(Role.administrator)) return true;
    }
    //Check if any role in roles == any group in groups
    return _me.roles.any((role) => groups.any((group) => role.name == group));
  }

  bool isAdministrator() {
    if (!env.production) {
      if (_me.roles.contains(Role.developer)) return true;
    }
    return (_me.roles.contains(Role.systemAdministrator) || _me.roles.contains(Role.administrator));
  }

  bool isCMSUser() {
    if (!env.production) {
      if (_me.roles.contains(Role.developer)) return true;
    }
    return (_me.roles.contains(Role.systemAdministrator) ||
        _me.roles.contains(Role.administrator) ||
        _me.roles.contains(Role.creator) ||
        _me.roles.contains(Role.contentManager) ||
        _me.roles.contains(Role.contentAssistent) ||
        _me.roles.contains(Role.marketingManager) ||
        _me.roles.contains(Role.marketingAssistent));
  }

  Future<void> refreshToken() async {
    Ticket ticket = await _authenticationRepository.refreshToken(_ticket.refreshToken, GrantType.refresh_token.name);
    _ticket = ticket;
  }
}
