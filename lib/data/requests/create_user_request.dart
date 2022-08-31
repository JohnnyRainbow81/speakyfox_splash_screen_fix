import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CreateProfileUserRequest {
  String firstname;
  String lastname;
  String email;
  String password;
  bool isOfferRegistration = false;
  String affiliateId;
  String formOfAddress = 'Unknown';

  CreateProfileUserRequest({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    required this.affiliateId,
     this.isOfferRegistration = false,
     this.formOfAddress = "Unknown",
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'password': password,
      'isOfferRegistration': isOfferRegistration,
      'affiliateId': affiliateId,
      'formOfAddress': formOfAddress,
    };
  }

  factory CreateProfileUserRequest.fromMap(Map<String, dynamic> map) {
    return CreateProfileUserRequest(
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      isOfferRegistration: map['isOfferRegistration'] as bool,
      affiliateId: map['affiliateId'] as String,
      formOfAddress: map['formOfAddress'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateProfileUserRequest.fromJson(String source) => CreateProfileUserRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}
