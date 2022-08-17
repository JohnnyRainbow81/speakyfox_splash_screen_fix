import 'package:speakyfox/data/dio_clients/authentication_client.dart';
import 'package:speakyfox/data/requests/reset_password_body.dart';
import 'package:speakyfox/data/responses/lecture_response.dart';
import 'package:speakyfox/data/responses/ticket_response.dart';
import 'package:speakyfox/data/responses/user_response.dart';
import 'package:speakyfox/domain/models/authentication.dart';
import 'package:speakyfox/domain/repositories/authentication_repository.dart';

class AuthenticationRemoteSource
    implements AuthenticationRepository<TicketResponse, UserResponse, LectureResponse> {
  final AuthenticationClient _authenticationClient;

  AuthenticationRemoteSource(this._authenticationClient);

  @override
  Future<TicketResponse> accessToken(String username, String password, String grantType) async {
    return _authenticationClient.accessToken(username, password, grantType);
  }

  @override
  Future<TicketResponse> refreshToken(String refreshToken, String grantType) {
    return _authenticationClient.refreshToken(refreshToken, grantType );
  }

  @override
  Future<bool> resetPassword(String userId, ResetPasswordBody body) async {
    return _authenticationClient.resetPassword(userId, body);
  }

  @override
  Future<UserResponse> fetchMe(String authToken) async {
    return _authenticationClient.fetchMe("Bearer $authToken");
  }

  @override
  Future<LectureResponse> getLastLecture(String lectureId) {
    // TODO: implement getLastLecture
    throw UnimplementedError();
  }

  @override
  Future<bool> sendPasswordResetEmail(String body) {
    // TODO: implement sendPasswordResetEmail
    throw UnimplementedError();
  }

  @override
  Future<LectureResponse> setLastLecture(String lectureId) {
    // TODO: implement setLastLecture
    throw UnimplementedError();
  }
}
