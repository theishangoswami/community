// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Community _$$_CommunityFromJson(Map<String, dynamic> json) => _$_Community(
      id: json['id'] as String,
      communityName: json['community_title'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$_CommunityToJson(_$_Community instance) =>
    <String, dynamic>{
      'id': instance.id,
      'community_title': instance.communityName,
      'status': instance.status,
    };
