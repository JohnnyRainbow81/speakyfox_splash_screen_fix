import 'package:dio/dio.dart' hide Response, Headers;
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/dtos/ticket_dto.dart';
import 'package:speakyfox/data/requests/authentication_body.dart';
import 'package:speakyfox/data/requests/refresh_token_body.dart';

part 'token_client.g.dart';


// We need this class because we cannot change the base url at runtime
// for SINGLE HTTP Calls with the Retrofit library. (Btw retrofit is awesome but this issue is stupid).
//
// So this class gets its *own base url* to avoid the need to change
// the base url for calls to /connect/token (which goes to our auth server and NOT to our backend server).
// This is the reason to split these authentication concerns into two classes: TokenClient and AuthenticationClient

@RestApi()
abstract class TokenClient {
  factory TokenClient(Dio dio, {String baseUrl}) = _TokenClient;

  @POST("/connect/token")  
  @Headers(<String, dynamic>{"Content-type": "application/x-www-form-urlencoded"})
  Future<TicketDto> accessToken(
    @Body() AuthenticationRequestBody body,
  );

  @POST("/connect/token")
  @Headers(<String, dynamic>{"Content-type": "application/x-www-form-urlencoded"})
  Future<TicketDto> refreshToken(
    @Body() RefreshTokenBody body,
  );

}
