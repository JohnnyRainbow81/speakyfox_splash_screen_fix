abstract class AuthenticationRepository<A, U, R, L> {
  Future<A> accessToken(
    String username,
    String password,
    String grantType,
  );
  Future<A> refreshToken(String refreshToken, String grantType);

  Future<U> fetchMe(String authToken);

  Future<R> resetPassword(String email);
  Future<bool> sendPasswordResetEmail(String body);

  Future<L> getLastLecture(String lectureId);
  Future<L> setLastLecture(String lectureId);

}
