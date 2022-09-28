import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/remote/token_client.dart';
import 'package:speakyfox/data/requests/authentication_body.dart';

Future<String> getAuthTokenForTesting() async {
  final authDio = await DioV1.initialize("https://speakyfox-api-production.herokuapp.com/api/v1/");
  TokenClient tokenClient = TokenClient(authDio);
  final response = await tokenClient.accessToken(AuthenticationRequestBody(userName: "stefan.anders@diggitize.com", password: "Peter123!", grantType: "password") );
  return response.accessToken;
}
