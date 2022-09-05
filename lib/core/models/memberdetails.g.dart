// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memberdetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MemberDetails _$$_MemberDetailsFromJson(Map<String, dynamic> json) =>
    _$_MemberDetails(
      userId: json['user_id'] as String,
      name: json['name'] as String,
      userRelation: json['user_relation'] as String,
      mobileNumber: json['mobile_number'] as String,
      adhaarNumber: json['adhar_number'] as String,
    );

Map<String, dynamic> _$$_MemberDetailsToJson(_$_MemberDetails instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.name,
      'user_relation': instance.userRelation,
      'mobile_number': instance.mobileNumber,
      'adhar_number': instance.adhaarNumber,
    };
