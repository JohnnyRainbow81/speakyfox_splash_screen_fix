import 'package:speakyfox/data/requests/reset_password_body.dart';
import 'package:speakyfox/data/requests/send_password_reset_body.dart';
import 'package:speakyfox/domain/models/lecture.dart';
import 'package:speakyfox/domain/models/ticket.dart';
import 'package:speakyfox/domain/models/user.dart';

//We don't have concrete Types in these interfaces where we have 2 different types in the flow like Lecture / LectureResponse
//We have concrete types when the type in the flow doesn't change, like ResetPasswordRequest
abstract class AuthenticationRepository {
  Future<Ticket> accessToken(
    String username,
    String password,
    String grantType,
  );
  Future<Ticket> refreshToken(String refreshToken, String grantType);

  Future<User> fetchUser(String authToken);

  Future<bool> resetPassword(String userId, ResetPasswordBody body);
  Future<bool> sendPasswordResetEmail(SendPasswordResetBody body);

  Future<Lecture> getLastLecture(String lectureId);
  Future<Lecture> setLastLecture(String lectureId);

}
