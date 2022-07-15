// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.id,
    required this.userName,
    required this.userEmail,
    required this.mobileNumber,
    required this.gender,
    required this.adharNumber,
    required this.passportNumber,
    required this.password,
    required this.registrationDate,
    required this.societyId,
    required this.profile,
    required this.status,
    required this.otp,
  });

  final String? id;
  final String? userName;
  final String? userEmail;
  final String? mobileNumber;
  final String? gender;
  final String? adharNumber;
  final String? passportNumber;
  final String? password;
  final String? registrationDate;
  final String? societyId;
  final String? profile;
  final String? status;
  final String? otp;

  UserModel copyWith({
    String? id,
    String? userName,
    String? userEmail,
    String? mobileNumber,
    String? gender,
    String? adharNumber,
    String? passportNumber,
    String? password,
    String? registrationDate,
    String? societyId,
    String? profile,
    String? status,
    String? otp,
  }) =>
      UserModel(
        id: id ?? this.id,
        userName: userName ?? this.userName,
        userEmail: userEmail ?? this.userEmail,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        gender: gender ?? this.gender,
        adharNumber: adharNumber ?? this.adharNumber,
        passportNumber: passportNumber ?? this.passportNumber,
        password: password ?? this.password,
        registrationDate: registrationDate ?? this.registrationDate,
        societyId: societyId ?? this.societyId,
        profile: profile ?? this.profile,
        status: status ?? this.status,
        otp: otp ?? this.otp,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        userName: json["user_name"],
        userEmail: json["user_email"],
        mobileNumber: json["mobile_number"],
        gender: json["gender"],
        adharNumber: json["adhar_number"],
        passportNumber: json["passport_number"],
        password: json["password"],
        registrationDate: json["registration_date"],
        societyId: json["society_id"],
        profile: json["profile"],
        status: json["status"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_name": userName,
        "user_email": userEmail,
        "mobile_number": mobileNumber,
        "gender": gender,
        "adhar_number": adharNumber,
        "passport_number": passportNumber,
        "password": password,
        "registration_date": registrationDate,
        "society_id": societyId,
        "profile": profile,
        "status": status,
        "otp": otp,
      };
}
