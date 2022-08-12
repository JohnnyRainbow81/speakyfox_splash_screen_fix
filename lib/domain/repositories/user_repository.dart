import 'package:speakyfox/domain/models/authentication.dart';
import 'package:speakyfox/domain/models/user.dart';

abstract class UserRepository {
  Future<User> getMe(String authToken);

  Future<ForgotPassword> forgotPassword(String email);

}
