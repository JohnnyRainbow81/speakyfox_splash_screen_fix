import 'package:speakyfox/data/requests/reset_password_body.dart';
import 'package:speakyfox/data/responses/lecture_response.dart';
import 'package:speakyfox/data/responses/ticket_response.dart';
import 'package:speakyfox/data/responses/user_response.dart';
import 'package:speakyfox/domain/models/lecture.dart';
import 'package:speakyfox/domain/models/ticket.dart';
import 'package:speakyfox/domain/repositories/authentication_repository.dart';

class AuthenticationLocalSource implements AuthenticationRepository<TicketResponse, UserResponse, LectureResponse> {
  @override
  Future<TicketResponse> accessToken(String username, String password, String grantType) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<TicketResponse> register(String userName, String email, String password, String mobileNumber, String profilePicture) {
    // TODO: implement register
    throw UnimplementedError();
  }

    @override
  Future<bool> resetPassword(String userId, ResetPasswordBody body) async {
   throw UnimplementedError();
  }

  @override
  Future<UserResponse> fetchMe(String authToken) async {
   throw UnimplementedError();
  }
  
  @override
  Future<LectureResponse> getLastLecture(String lectureId) {
    // TODO: implement getLastLecture
    throw UnimplementedError();
  }
  
  @override
  Future<TicketResponse> refreshToken(String refreshToken,String grantType) {
    // TODO: implement refreshToken
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