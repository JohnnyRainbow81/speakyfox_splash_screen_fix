
import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/data/responses/base_response.dart';

import 'package:speakyfox/data/responses/code.dart';
import 'package:speakyfox/data/responses/user_response.dart';

part 'response.g.dart';

@JsonSerializable()
class Response<T> {
  Code code;
  @_Converter()
  T data;
  String? description;
  int? total;
  dynamic errors;
  String? message;

  Response({
    required this.code,
    required this.data,
    required this.description,
    required this.total,
    required this.errors,
    required this.message,
  });

  factory Response.fromJson(Map<String, dynamic> json) => _$ResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}

class _Converter<T> implements JsonConverter<T, Object> {
  const _Converter();

  @override
  T fromJson(Object json) {
    if (json is Map<String, dynamic> && T is UserResponse) {
      return UserResponse.fromJson(json) as T;
    }
    return json as T;
  }

  @override
  Object toJson(T object) {
    if (object is BaseResponse) return object.toJson();
    return {};
  }
}
// ignore_for_file: public_member_api_docs, sort_constructors_first

// @JsonSerializable()
// class Code {
//   @JsonKey(name: "group")
//   int? group;
//   @JsonKey(name: "internalCode")
//   int? internalCode;
//   @JsonKey(name: "statusCode")
//   int? statusCode;
  
  
// }

  

// export class Response<T> {
//   code: any;
//   data: T;
//   description: string;
//   total: number;
//   errors: any;
//   message: string;
// }
