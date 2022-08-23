import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/remote/authentication_client.dart';

Future<String> testGetAuthToken() async {
  final authDio = await DioAuth.initialize("https://speakyfox-api-production.herokuapp.com/api/v1/");
  AuthenticationClient authenticationClient = AuthenticationClient(authDio);
  final response = await authenticationClient.accessToken("stefan_anders@gmx.net", "Kuchen1981!", "password");
  return response.accessToken;
}
