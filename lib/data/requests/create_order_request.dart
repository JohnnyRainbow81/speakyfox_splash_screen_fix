import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CreateOrderRequest {
  String subscriptionId;
  String referer;
  String externalId;
  String paymentMethod;
  CreateOrderRequest({
    required this.subscriptionId,
    required this.referer,
    required this.externalId,
    required this.paymentMethod,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subscriptionId': subscriptionId,
      'referer': referer,
      'externalId': externalId,
      'paymentMethod': paymentMethod,
    };
  }

  factory CreateOrderRequest.fromMap(Map<String, dynamic> map) {
    return CreateOrderRequest(
      subscriptionId: map['subscriptionId'] as String,
      referer: map['referer'] as String,
      externalId: map['externalId'] as String,
      paymentMethod: map['paymentMethod'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateOrderRequest.fromJson(String source) => CreateOrderRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}
