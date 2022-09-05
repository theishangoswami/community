// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatbox.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatBoxModel _$$_ChatBoxModelFromJson(Map<String, dynamic> json) =>
    _$_ChatBoxModel(
      id: json['id'] as String,
      receiverId: json['from_id'] as String,
      senderId: json['to_id'] as String,
      message: json['message'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$$_ChatBoxModelToJson(_$_ChatBoxModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from_id': instance.receiverId,
      'to_id': instance.senderId,
      'message': instance.message,
      'date': instance.date,
    };
