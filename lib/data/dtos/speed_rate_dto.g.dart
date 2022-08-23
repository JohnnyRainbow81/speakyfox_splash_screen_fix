// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speed_rate_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpeedRateDto _$SpeedRateDtoFromJson(Map<String, dynamic> json) => SpeedRateDto(
      speed: $enumDecode(_$RateEnumMap, json['speed']),
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$SpeedRateDtoToJson(SpeedRateDto instance) =>
    <String, dynamic>{
      'speed': _$RateEnumMap[instance.speed]!,
      'value': instance.value,
    };

const _$RateEnumMap = {
  Rate.normal: 'normal',
  Rate.extremlySlow: 'extremlySlow',
  Rate.superSlow: 'superSlow',
  Rate.slow: 'slow',
  Rate.fast: 'fast',
};
