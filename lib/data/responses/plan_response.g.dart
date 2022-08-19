// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanResponse _$PlanResponseFromJson(Map<String, dynamic> json) => PlanResponse(
      id: json['id'] as String,
      modified: json['modified'] as String,
      modifiedBy: json['modifiedBy'] as String,
      created: json['created'] as String,
      createdBy: json['createdBy'] as String,
      deleted: json['deleted'] as String,
      deletedBy: json['deletedBy'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      displayTitle: json['displayTitle'] as String,
      isPublished: json['isPublished'] as bool,
      interval: json['interval'] as String,
      intervalCount: json['intervalCount'] as int,
      currency: json['currency'] as String,
      unitAmount: json['unitAmount'] as int,
      trialPeriodDays: json['trialPeriodDays'] as int,
      taxPercent: json['taxPercent'] as int,
      productId: json['productId'] as String,
      product:
          ProductResponse.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlanResponseToJson(PlanResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modified': instance.modified,
      'modifiedBy': instance.modifiedBy,
      'created': instance.created,
      'createdBy': instance.createdBy,
      'deleted': instance.deleted,
      'deletedBy': instance.deletedBy,
      'title': instance.title,
      'description': instance.description,
      'displayTitle': instance.displayTitle,
      'isPublished': instance.isPublished,
      'interval': instance.interval,
      'intervalCount': instance.intervalCount,
      'currency': instance.currency,
      'unitAmount': instance.unitAmount,
      'trialPeriodDays': instance.trialPeriodDays,
      'taxPercent': instance.taxPercent,
      'productId': instance.productId,
      'product': instance.product,
    };
