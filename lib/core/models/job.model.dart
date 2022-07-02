// To parse this JSON data, do
//
//     final jobModel = jobModelFromJson(jsonString?);

import 'dart:convert';

JobModel jobModelFromJson(String str) => JobModel.fromJson(json.decode(str));

String jobModelToJson(JobModel data) => json.encode(data.toJson());

class JobModel {
  JobModel({
    this.id,
    required this.userId,
    required this.jobsTitle,
    required this.description,
    required this.companyName,
    required this.gender,
    required this.experience,
    required this.education,
    required this.location,
    required this.packages,
    required this.status,
    required this.date,
  });

  final String? id;
  final String? userId;
  final String? jobsTitle;
  final String? description;
  final String? companyName;
  final String? gender;
  final String? experience;
  final String? education;
  final String? location;
  final String? packages;
  final String? status;
  final String? date;

  JobModel copyWith({
    String? id,
    String? userId,
    String? jobsTitle,
    String? description,
    String? companyName,
    String? gender,
    String? experience,
    String? education,
    String? location,
    String? packages,
    String? status,
    String? date,
  }) =>
      JobModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        jobsTitle: jobsTitle ?? this.jobsTitle,
        description: description ?? this.description,
        companyName: companyName ?? this.companyName,
        gender: gender ?? this.gender,
        experience: experience ?? this.experience,
        education: education ?? this.education,
        location: location ?? this.location,
        packages: packages ?? this.packages,
        status: status ?? this.status,
        date: date ?? this.date,
      );

  factory JobModel.fromJson(Map<String?, dynamic> json) => JobModel(
        id: json["id"],
        userId: json["user_id"],
        jobsTitle: json["jobs_title"],
        description: json["description"],
        companyName: json["company_name"],
        gender: json["gender"],
        experience: json["experience"],
        education: json["education"],
        location: json["location"],
        packages: json["packages"],
        status: json["status"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "jobs_title": jobsTitle,
        "description": description,
        "company_name": companyName,
        "gender": gender,
        "experience": experience,
        "education": education,
        "location": location,
        "packages": packages,
        "status": status,
        "date": date,
      };
}
