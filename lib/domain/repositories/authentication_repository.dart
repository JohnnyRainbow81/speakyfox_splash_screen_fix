import 'package:speakyfox/domain/models/authentication.dart';

abstract class AuthenticationRepository<T>{

  Future<T> login(
   String username,
    String password,
     String grantType,
  );


  Future<T> register(
      String userName,
      String email,
      String password,
      String mobileNumber,
      String profilePicture,
      );

}