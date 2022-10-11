
import 'package:json_annotation/json_annotation.dart';

part 'create_user_request.g.dart';

@JsonSerializable()
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

  factory CreateProfileUserRequest.fromJson(Map<String, dynamic> json) => _$CreateProfileUserRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateProfileUserRequestToJson(this);
}
