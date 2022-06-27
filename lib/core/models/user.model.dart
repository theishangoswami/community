import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.id,
    required this.userName,
    required this.userEmail,
    required this.mobileNumber,
    required this.adharNumber,
    required this.passportNumber,
    required this.password,
    required this.registrationDate,
    required this.status,
    required this.otp,
  });

  final String? id;
  final String? userName;
  final String? userEmail;
  final String? mobileNumber;
  final String? adharNumber;
  final String? passportNumber;
  final String? password;
  final String? registrationDate;
  final String? status;
  final String? otp;

  UserModel copyWith({
    String? id,
    String? userName,
    String? userEmail,
    String? mobileNumber,
    String? adharNumber,
    String? passportNumber,
    String? password,
    String? registrationDate,
    String? status,
    String? otp,
  }) =>
      UserModel(
        id: id ?? this.id,
        userName: userName ?? this.userName,
        userEmail: userEmail ?? this.userEmail,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        adharNumber: adharNumber ?? this.adharNumber,
        passportNumber: passportNumber ?? this.passportNumber,
        password: password ?? this.password,
        registrationDate: registrationDate ?? this.registrationDate,
        status: status ?? this.status,
        otp: otp ?? this.otp,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        userName: json["user_name"],
        userEmail: json["user_email"],
        mobileNumber: json["mobile_number"],
        adharNumber: json["adhar_number"],
        passportNumber: json["passport_number"],
        password: json["password"],
        registrationDate: json["registration_date"],
        status: json["status"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_name": userName,
        "user_email": userEmail,
        "mobile_number": mobileNumber,
        "adhar_number": adharNumber,
        "passport_number": passportNumber,
        "password": password,
        "registration_date": registrationDate,
        "status": status,
        "otp": otp,
      };
}
