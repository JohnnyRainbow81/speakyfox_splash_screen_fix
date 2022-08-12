// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuthenticationRequest {
  String userName;
  String password;
  String grantType;
  
  AuthenticationRequest({
    required this.userName,
    required this.password,
    required this.grantType,
  });
}
