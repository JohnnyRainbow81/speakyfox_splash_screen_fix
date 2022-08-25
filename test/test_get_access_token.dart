import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/remote/authentication_client.dart';
import 'package:speakyfox/data/requests/authentication_body.dart';

Future<String> getAuthTokenForTesting() async {
  final authDio = await DioAuth.initialize("https://speakyfox-api-production.herokuapp.com/api/v1/");
  AuthenticationClient authenticationClient = AuthenticationClient(authDio);
  final response = await authenticationClient.accessToken(AuthenticationRequestBody(userName: "stefan_anders@gmx.net", password: "Kuchen1981!", grantType: "password") );
  return response.accessToken;
}
