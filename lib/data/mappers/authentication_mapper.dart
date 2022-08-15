import 'package:speakyfox/data/responses/authentication_response.dart';
import 'package:speakyfox/domain/models/authentication.dart';

extension AuthenticationResponseMapper on AuthenticationResponse {
  Authentication toAuthentication() {
    return Authentication(
        accessToken: accessToken, expiresIn: expiresIn, refreshToken: refreshToken, scope: scope, tokenType: tokenType);
  }
}

extension ResetPasswordResponseMapper on ResetPasswordResponse {
  ResetPassword toResetPassword() {
    return ResetPassword(
      password: password, 
      token: token
    );
  }
}
