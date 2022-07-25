// To parse this JSON data, do
//
//     final communityModel = communityModelFromJson(jsonString);

import 'dart:convert';

import 'package:community_internal/app/constants.dart';

SocietyModel communityModelFromJson(String str) =>
    SocietyModel.fromJson(json.decode(str));

String communityModelToJson(SocietyModel data) => json.encode(data.toJson());

class SocietyModel {
  SocietyModel({
    required this.id,
    required this.userId,
    required this.societyName,
    required this.societyCityId,
    required this.communityId,
    required this.societyAddress,
    required this.societyDocuments,
    required this.societyLogo,
    required this.person,
    required this.status,
    required this.date,
  });

  final String id;
  final String? userId;
  final String? societyName;
  final String? societyCityId;
  final String? communityId;
  final String? societyAddress;
  final String? societyDocuments;
  final String? societyLogo;
  final String? person;
  final String? status;
  final DateTime? date;

  SocietyModel copyWith({
    String? id,
    String? userId,
    String? societyName,
    String? societyCityId,
    String? communityId,
    String? societyAddress,
    String? societyDocuments,
    String? societyLogo,
    String? person,
    String? status,
    DateTime? date,
  }) =>
      SocietyModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        societyName: societyName ?? this.societyName,
        societyCityId: societyCityId ?? this.societyCityId,
        communityId: communityId ?? this.communityId,
        societyAddress: societyAddress ?? this.societyAddress,
        societyDocuments: societyDocuments ?? this.societyDocuments,
        societyLogo: societyLogo ?? this.societyLogo,
        person: person ?? this.person,
        status: status ?? this.status,
        date: date ?? this.date,
      );

  factory SocietyModel.fromJson(Map<String, dynamic> json) => SocietyModel(
        id: json["id"],
        userId: json["user_id"],
        societyName: json["society_name"],
        societyCityId: json["society_city_id"],
        communityId: json["community_id"],
        societyAddress: json["society_address"],
        societyDocuments: json["society_documents"],
        societyLogo: json["society_logo"] == null
            ? null
            : Constants.imageBaseUrl + json["society_logo"],
        person: json["person"],
        status: json["status"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "society_name": societyName,
        "society_city_id": societyCityId,
        "community_id": communityId,
        "society_address": societyAddress,
        "society_documents": societyDocuments,
        "society_logo": societyLogo,
        "person": person,
        "status": status,
        "date": date?.toIso8601String(),
      };
}
