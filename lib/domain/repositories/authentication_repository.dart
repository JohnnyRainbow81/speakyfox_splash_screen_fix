import 'package:speakyfox/domain/models/authentication.dart';

abstract class AuthenticationRepository<A, U, R> {
  Future<A> fetchAccessToken(
    String username,
    String password,
    String grantType,
  );

  Future<U> fetchMe(String authToken);

  Future<R> resetPassword(String email);

  Future<bool> sendPasswordResetEmail(String body);

  
}
