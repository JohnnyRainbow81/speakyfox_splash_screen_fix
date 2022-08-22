// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponResponse _$CouponResponseFromJson(Map<String, dynamic> json) =>
    CouponResponse(
      id: json['id'] as String,
      modified: json['modified'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      created: json['created'] as String?,
      createdBy: json['createdBy'] as String?,
      deleted: json['deleted'] as String?,
      deletedBy: json['deletedBy'] as String?,
      key: json['key'] as String,
      name: json['name'] as String?,
      amountOff: json['amountOff'] as int?,
      percentOff: json['percentOff'] as int?,
      planId: json['planId'] as String,
      duration: json['duration'] as String,
      durationInMonths: json['durationInMonths'] as int?,
    );

Map<String, dynamic> _$CouponResponseToJson(CouponResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modified': instance.modified,
      'modifiedBy': instance.modifiedBy,
      'created': instance.created,
      'createdBy': instance.createdBy,
      'deleted': instance.deleted,
      'deletedBy': instance.deletedBy,
      'key': instance.key,
      'name': instance.name,
      'amountOff': instance.amountOff,
      'percentOff': instance.percentOff,
      'planId': instance.planId,
      'duration': instance.duration,
      'durationInMonths': instance.durationInMonths,
    };
