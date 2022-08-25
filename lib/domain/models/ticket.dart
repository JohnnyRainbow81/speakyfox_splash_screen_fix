// ignore_for_file: public_member_api_docs, sort_constructors_first
class Ticket {
  String accessToken;
  int expiresIn;
  String? refreshToken;
  String scope;
  String tokenType;
  
  Ticket({
    required this.accessToken,
    required this.expiresIn,
    this.refreshToken,
    required this.scope,
    required this.tokenType,
  });

  @override
  String toString() {
    return 'Ticket(accessToken: $accessToken, expiresIn: $expiresIn, refreshToken: $refreshToken, scope: $scope, tokenType: $tokenType)';
  }
}

//redundant?
class ResetPassword {
  String password;
  String token;

  ResetPassword({
    required this.password,
    required this.token,
  });
}

