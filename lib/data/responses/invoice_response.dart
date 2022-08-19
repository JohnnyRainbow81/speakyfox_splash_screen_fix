import 'package:json_annotation/json_annotation.dart';

part 'invoice_response.g.dart';

@JsonSerializable()
class InvoiceResponse {

  String periodStart;
  String periodEnd;
  int total;
  String status;
  bool paid;
  String dueDate;
  String currency;
  dynamic paymentMethod;
  
  InvoiceResponse({
    required this.periodStart,
    required this.periodEnd,
    required this.total,
    required this.status,
    required this.paid,
    required this.dueDate,
    required this.currency,
    required this.paymentMethod,
  });

  factory InvoiceResponse.fromJson(Map<String, dynamic> json) => _$InvoiceResponseFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceResponseToJson(this);
}