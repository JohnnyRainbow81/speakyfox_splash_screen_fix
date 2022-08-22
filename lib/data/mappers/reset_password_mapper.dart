import 'package:speakyfox/data/dtos/reset_password_dto.dart';
import 'package:speakyfox/domain/models/ticket.dart';

extension ResetPasswordMapper on ResetPasswordDto {
  ResetPassword toResetPassword() {
    return ResetPassword(password: password, token: token);
  }
}
