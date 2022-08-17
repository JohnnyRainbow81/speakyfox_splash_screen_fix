import 'package:json_annotation/json_annotation.dart';

enum Role {
  @JsonValue("systemAdministrator")
  systemAdministrator,
  @JsonValue("administrator")
  administrator,
  @JsonValue("developer")
  developer,
  @JsonValue("user")
  user,
  @JsonValue("creator")
  creator,
  @JsonValue("contentManager")
  contentManager,
  @JsonValue("contentAssistent")
  contentAssistent,
  @JsonValue("marketingManager")
  marketingManager,
  @JsonValue("marketingAssistent")
  marketingAssistent
}
