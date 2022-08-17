// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'send_password_reset_body.g.dart';

@JsonSerializable()
class SendPasswordResetBody {
  String email;

  SendPasswordResetBody({
    required this.email,
  });

  factory SendPasswordResetBody.fromJson(Map<String, dynamic> json) => _$SendPasswordResetBodyFromJson(json);
  Map<String, dynamic> toJson() => _$SendPasswordResetBodyToJson(this);
}
