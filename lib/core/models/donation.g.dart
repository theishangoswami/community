// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Donation _$$_DonationFromJson(Map<String, dynamic> json) => _$_Donation(
      name: json['user_name'] as String,
      amount: json['donation_amount'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$$_DonationToJson(_$_Donation instance) =>
    <String, dynamic>{
      'user_name': instance.name,
      'donation_amount': instance.amount,
      'date': instance.date,
    };
