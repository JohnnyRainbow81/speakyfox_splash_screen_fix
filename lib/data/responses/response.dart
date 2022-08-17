import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/data/responses/code.dart';

part 'response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Response<T> {
  Code code;
  //@_Converter()

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

   factory Response.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ResponseFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ResponseToJson(this, toJsonT);
}



/* class _Converter<T> implements JsonConverter<T, Object> {
  const _Converter();

  @override
  T fromJson(Object json) {
    if (json is Map<String, dynamic>) {
      switch () {
        case TicketResponse:
          return TicketResponse.fromJson(json) as T;
        case UserResponse:
          return UserResponse.fromJson(json) as T;
      }
    }
    throw Exception("Couldn't parse json");
  }

  @override
  Object toJson(T object) {
    if (object is BaseResponse) return object.toJson();
    return {};
  }
} */
