import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/data/dtos/code.dart';

part 'response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Response<T> {
  Code code;
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
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$ResponseToJson(this, toJsonT);
}
