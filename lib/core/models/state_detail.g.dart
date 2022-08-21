// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StateDetail _$$_StateDetailFromJson(Map<String, dynamic> json) =>
    _$_StateDetail(
      id: json['id'] as String,
      countryId: json['country_id'] as String?,
      stateName: json['state_name'] as String,
    );

Map<String, dynamic> _$$_StateDetailToJson(_$_StateDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'country_id': instance.countryId,
      'state_name': instance.stateName,
    };
