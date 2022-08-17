import 'package:speakyfox/data/requests/reset_password_body.dart';

//We don't have concrete Types in these interfaces where we have 2 different types in the flow like Lecture / LectureResponse
//We have concrete types when the type in the flow doesn't change, like ResetPasswordRequest
abstract class AuthenticationRepository<T, RT, RU, RL, RR> {
  Future<T> accessToken(
    String username,
    String password,
    String grantType,
  );
  Future<RT> refreshToken(String refreshToken, String grantType);

  Future<RU> fetchUser(String authToken);

  Future<RR> resetPassword(String userId, ResetPasswordBody body);
  Future<RR> sendPasswordResetEmail(String body);

  Future<RL> getLastLecture(String lectureId);
  Future<RL> setLastLecture(String lectureId);

}
