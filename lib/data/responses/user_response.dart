// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/data/responses/base_response.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse extends BaseResponse {
  @override
  String id;
  String? formOfAddress;
  String? firstname;
  String? lastname;
  String? userName;
  String? normalizedUserName;
  String email;
  bool? emailConfirmed;
  String? normalizedEmail;
  int? accessFailedAccount;
  bool? lockoutEnabled;
  String? password;
  String? lockoutEnd;
  List<String>? policies;
  String? currentLanguagePairId;
  String? currentSourceLanguageId;
  String? currentTargetLanguageId;
  List<String>? roles;
  List<String>? subscriptionIds;
  UserResponse({
    required this.id,
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    this.formOfAddress,
    this.firstname,
    this.lastname,
    this.userName,
    this.normalizedUserName,
    required this.email,
    this.emailConfirmed,
    this.normalizedEmail,
    this.accessFailedAccount,
    this.lockoutEnabled,
    this.password,
    this.lockoutEnd,
    this.policies,
    this.currentLanguagePairId,
    this.currentSourceLanguageId,
    this.currentTargetLanguageId,
    this.roles,
    this.subscriptionIds,
  }) : super(
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
