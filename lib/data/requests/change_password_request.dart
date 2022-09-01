import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChangePasswordRequest {
  String currentPassword;
  String password;

  ChangePasswordRequest({
    required this.currentPassword,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentPassword': currentPassword,
      'password': password,
    };
  }

  factory ChangePasswordRequest.fromMap(Map<String, dynamic> map) {
    return ChangePasswordRequest(
      currentPassword: map['currentPassword'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChangePasswordRequest.fromJson(String source) =>
      ChangePasswordRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}


