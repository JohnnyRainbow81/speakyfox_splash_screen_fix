import 'package:speakyfox/domain/models/authentication.dart';

abstract class AuthenticationRepository<Authorization>{

  Future<Authentication> login(
   String username,
    String password,
     String grantType,
  );

  Future<ForgotPassword> forgotPassword(String email);

  Future<Authentication> register(
      String userName,
      String email,
      String password,
      String mobileNumber,
      String profilePicture,
      );

}