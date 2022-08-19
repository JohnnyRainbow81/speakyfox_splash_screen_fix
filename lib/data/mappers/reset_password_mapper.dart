import 'package:speakyfox/data/responses/reset_password_response.dart';
import 'package:speakyfox/domain/models/ticket.dart';

extension ResetPasswordMapper on ResetPasswordResponse {
  ResetPassword toResetPassword() {
    return ResetPassword(password: password, token: token);
  }
}
