// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userstatus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserStatus _$$_UserStatusFromJson(Map<String, dynamic> json) =>
    _$_UserStatus(
      userId: json['id'] as String,
      status: json['status'] as String,
      userType: json['usertype'] as String,
    );

Map<String, dynamic> _$$_UserStatusToJson(_$_UserStatus instance) =>
    <String, dynamic>{
      'id': instance.userId,
      'status': instance.status,
      'usertype': instance.userType,
    };
