import 'package:speakyfox/data/requests/reset_password_body.dart';

//We don't have concrete Types in these interfaces where we have 2 different types in the flow like Lecture / LectureResponse
//We have concrete types when the type in the flow doesn't change, like ResetPasswordRequest
abstract class AuthenticationRepository<A, U, L> {
  Future<A> accessToken(
    String username,
    String password,
    String grantType,
  );
  Future<A> refreshToken(String refreshToken, String grantType);

  Future<U> fetchMe(String authToken);

  Future<bool> resetPassword(String userId, ResetPasswordBody body);
  Future<bool> sendPasswordResetEmail(String body);

  Future<L> getLastLecture(String lectureId);
  Future<L> setLastLecture(String lectureId);

}
