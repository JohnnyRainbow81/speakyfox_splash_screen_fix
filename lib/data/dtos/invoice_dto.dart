import 'package:json_annotation/json_annotation.dart';

part 'invoice_dto.g.dart';

@JsonSerializable()
class InvoiceDto {
  String periodStart;
  String periodEnd;
  int total;
  String status;
  bool paid;
  String? dueDate;
  String? currency;
  dynamic paymentMethod;

  InvoiceDto({
    required this.periodStart,
    required this.periodEnd,
    required this.total,
    required this.status,
    required this.paid,
    required this.dueDate,
    required this.currency,
    required this.paymentMethod,
  });

  factory InvoiceDto.fromJson(Map<String, dynamic> json) => _$InvoiceDtoFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceDtoToJson(this);
}
