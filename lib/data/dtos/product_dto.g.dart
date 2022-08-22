// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => ProductDto(
      id: json['id'] as String,
      modified: json['modified'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      created: json['created'] as String?,
      createdBy: json['createdBy'] as String?,
      deleted: json['deleted'] as String?,
      deletedBy: json['deletedBy'] as String?,
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
      product: ProductDto.fromJson(json['product'] as Map<String, dynamic>),
      plans: (json['plans'] as List<dynamic>).map((e) => PlanDto.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$ProductDtoToJson(ProductDto instance) => <String, dynamic>{
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
      'plans': instance.plans,
    };
