import 'package:speakyfox/data/requests/reset_password_body.dart';
import 'package:speakyfox/data/responses/lecture_response.dart';
import 'package:speakyfox/data/responses/response.dart';
import 'package:speakyfox/data/responses/ticket_response.dart';
import 'package:speakyfox/data/responses/user_response.dart';
import 'package:speakyfox/domain/models/lecture.dart';
import 'package:speakyfox/domain/models/ticket.dart';
import 'package:speakyfox/domain/repositories/authentication_repository.dart';

class AuthenticationLocalSource implements AuthenticationRepository<TicketResponse, Response<TicketResponse>, Response<UserResponse>, Response<LectureResponse>, Response<bool>> {
  @override
  Future<TicketResponse> accessToken(String username, String password, String grantType) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Response<TicketResponse>> register(String userName, String email, String password, String mobileNumber, String profilePicture) {
    // TODO: implement register
    throw UnimplementedError();
  }

    @override
  Future<Response<bool>> resetPassword(String userId, ResetPasswordBody body) async {
   throw UnimplementedError();
  }

  @override
  Future<Response<UserResponse>> fetchUser(String authToken) async {
   throw UnimplementedError();
  }
  
  @override
  Future<Response<LectureResponse>> getLastLecture(String lectureId) {
    // TODO: implement getLastLecture
    throw UnimplementedError();
  }
  
  @override
  Future<Response<TicketResponse>> refreshToken(String refreshToken,String grantType) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }
  
  @override
  Future<Response<bool>> sendPasswordResetEmail(String body) {
    // TODO: implement sendPasswordResetEmail
    throw UnimplementedError();
  }
  
  @override
  Future<Response<LectureResponse>> setLastLecture(String lectureId) {
    // TODO: implement setLastLecture
    throw UnimplementedError();
  }
}