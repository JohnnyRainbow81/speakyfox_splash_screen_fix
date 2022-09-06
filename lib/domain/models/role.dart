import 'package:json_annotation/json_annotation.dart';


//Serialization with @JsonValue doesn't work currently,
//this might be a solution: https://github.com/google/json_serializable.dart/issues/653
//Fix for now: Rename enum values to their exact name in serialized form (json)
@JsonEnum()
enum Role {
  @JsonValue("SystemAdministrator")
  SystemAdministrator,
  @JsonValue("Administrator")
  Administrator,
  @JsonValue("Developer")
  Developer,
  @JsonValue("User")
  User,
  @JsonValue("Creator")
  Creator,
  @JsonValue("ContentManager")
  ContentManager,
  @JsonValue("ContentAssistent")
  ContentAssistent,
  @JsonValue("MarketingManager")
  MarketingManager,
  @JsonValue("MarketingAssistent")
  MarketingAssistent
}
