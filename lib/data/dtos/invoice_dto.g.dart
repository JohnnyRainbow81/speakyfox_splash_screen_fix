// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceDto _$InvoiceDtoFromJson(Map<String, dynamic> json) => InvoiceDto(
      periodStart: json['periodStart'] as String,
      periodEnd: json['periodEnd'] as String,
      total: json['total'] as int,
      status: json['status'] as String,
      paid: json['paid'] as bool,
      dueDate: json['dueDate'] as String,
      currency: json['currency'] as String,
      paymentMethod: json['paymentMethod'],
    );

Map<String, dynamic> _$InvoiceDtoToJson(InvoiceDto instance) =>
    <String, dynamic>{
      'periodStart': instance.periodStart,
      'periodEnd': instance.periodEnd,
      'total': instance.total,
      'status': instance.status,
      'paid': instance.paid,
      'dueDate': instance.dueDate,
      'currency': instance.currency,
      'paymentMethod': instance.paymentMethod,
    };
