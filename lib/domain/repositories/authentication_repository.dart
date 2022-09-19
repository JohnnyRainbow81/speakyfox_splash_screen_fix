import 'package:speakyfox/data/requests/authentication_body.dart';
import 'package:speakyfox/data/requests/create_user_request.dart';
import 'package:speakyfox/data/requests/refresh_token_body.dart';
import 'package:speakyfox/data/requests/reset_password_body.dart';
import 'package:speakyfox/data/requests/send_password_reset_body.dart';
import 'package:speakyfox/domain/models/identity_token.dart';
import 'package:speakyfox/domain/models/lecture.dart';
import 'package:speakyfox/domain/models/ticket.dart';
import 'package:speakyfox/domain/models/user.dart';

abstract class AuthenticationRepository {
  Future<Ticket> accessToken(AuthenticationRequestBody body);
  Future<Ticket> refreshToken(RefreshTokenBody body);

  Future<User> register(CreateProfileUserRequest user);

  Future<User> fetchUser(String authToken);
  
  User? loadUser();
  IdentityToken? loadCredentials();
  Future<bool> saveCredentials(IdentityToken identityToken);
  Future<bool> clearCredentials();

  Future<bool> resetPassword(String userId, ResetPasswordBody body);
  Future<bool> sendPasswordResetEmail(SendPasswordResetBody body);

  Future<Lecture> getLastLecture(String lectureId);
  Future<Lecture> setLastLecture(String lectureId);

  Future<bool> validateToken(String userId, String token);
}
