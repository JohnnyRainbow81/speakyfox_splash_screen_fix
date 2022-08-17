import 'package:speakyfox/data/dio_clients/authentication_client.dart';
import 'package:speakyfox/data/requests/reset_password_body.dart';
import 'package:speakyfox/data/responses/lecture_response.dart';
import 'package:speakyfox/data/responses/response.dart';
import 'package:speakyfox/data/responses/ticket_response.dart';
import 'package:speakyfox/data/responses/user_response.dart';
import 'package:speakyfox/domain/repositories/authentication_repository.dart';

class AuthenticationRemoteSource
    implements AuthenticationRepository<Response<TicketResponse>, Response<UserResponse>, Response<LectureResponse>, Response<bool>> {
  final AuthenticationClient _authenticationClient;

  AuthenticationRemoteSource(this._authenticationClient);

  @override
  Future<Response<TicketResponse>> accessToken(String username, String password, String grantType) async {
    return _authenticationClient.accessToken(username, password, grantType);
  }

  @override
  Future<Response<TicketResponse>> refreshToken(String refreshToken, String grantType) {
    return _authenticationClient.refreshToken(refreshToken, grantType );
  }

  @override
  Future<Response<bool>> resetPassword(String userId, ResetPasswordBody body) async {
    return _authenticationClient.resetPassword(userId, body);
  }

  @override
  Future<Response<UserResponse>> fetchUser(String authToken) async {
    return _authenticationClient.fetchMe("Bearer $authToken");
  }

  @override
  Future<Response<LectureResponse>> getLastLecture(String lectureId) {
    // TODO: implement getLastLecture
    throw UnimplementedError();
  }

  @override
  Future<Response<bool>>  sendPasswordResetEmail(String body) {
    // TODO: implement sendPasswordResetEmail
    throw UnimplementedError();
  }

  @override
  Future<Response<LectureResponse>> setLastLecture(String lectureId) {
    // TODO: implement setLastLecture
    throw UnimplementedError();
  }
}
