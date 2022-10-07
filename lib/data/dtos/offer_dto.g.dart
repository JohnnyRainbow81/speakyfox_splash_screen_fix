// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferDto _$OfferDtoFromJson(Map<String, dynamic> json) => OfferDto(
      id: json['id'] as String,
      modified: json['modified'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      created: json['created'] as String?,
      createdBy: json['createdBy'] as String?,
      deleted: json['deleted'] as String?,
      deletedBy: json['deletedBy'] as String?,
      planId: json['planId'] as String,
      offerTitle: json['offerTitle'] as String,
      registrationTitle: json['registrationTitle'] as String?,
      descriptionTitle: json['descriptionTitle'] as String?,
      descriptionContents: (json['descriptionContents'] as List<dynamic>)
          .map((e) =>
              OfferDescriptionContentDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      offerContent: json['offerContent'] as String,
      thankYouContent: json['thankYouContent'] as String?,
      coupons: (json['coupons'] as List<dynamic>?)
          ?.map((e) => CouponDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      thankYouPageEnabled: json['thankYouPageEnabled'] as bool?,
      registrationEnabled: json['registrationEnabled'] as bool,
      loginEnabled: json['loginEnabled'] as bool,
      offerStart: json['offerStart'] as String?,
      offerEnd: json['offerEnd'] as String?,
      originalAmount: json['originalAmount'] as int,
      loginTitle: json['loginTitle'] as String,
      referer: json['referer'] as String?,
      isAllowedCoupon: json['isAllowedCoupon'] as bool,
      ref: json['ref'] as String,
      plan: PlanDto.fromJson(json['plan'] as Map<String, dynamic>),
      details: json['details'] as String?,
      planTitle: json['planTitle'] as String?,
      planDescription: json['planDescription'] as String?,
    );

Map<String, dynamic> _$OfferDtoToJson(OfferDto instance) => <String, dynamic>{
      'id': instance.id,
      'modified': instance.modified,
      'modifiedBy': instance.modifiedBy,
      'created': instance.created,
      'createdBy': instance.createdBy,
      'deleted': instance.deleted,
      'deletedBy': instance.deletedBy,
      'planId': instance.planId,
      'offerTitle': instance.offerTitle,
      'registrationTitle': instance.registrationTitle,
      'descriptionTitle': instance.descriptionTitle,
      'descriptionContents': instance.descriptionContents,
      'offerContent': instance.offerContent,
      'thankYouContent': instance.thankYouContent,
      'coupons': instance.coupons,
      'thankYouPageEnabled': instance.thankYouPageEnabled,
      'registrationEnabled': instance.registrationEnabled,
      'loginEnabled': instance.loginEnabled,
      'offerStart': instance.offerStart,
      'offerEnd': instance.offerEnd,
      'originalAmount': instance.originalAmount,
      'loginTitle': instance.loginTitle,
      'referer': instance.referer,
      'isAllowedCoupon': instance.isAllowedCoupon,
      'ref': instance.ref,
      'plan': instance.plan,
      'details': instance.details,
      'planTitle': instance.planTitle,
      'planDescription': instance.planDescription,
    };
