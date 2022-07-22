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
    this.companyLogo,
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
  final String? companyLogo;
  final String? status;
  final DateTime? date;

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
    String? companyLogo,
    String? status,
    DateTime? date,
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
        companyLogo: companyLogo ?? this.companyLogo,
        status: status ?? this.status,
        date: date ?? this.date,
      );

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
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
        companyLogo: json["company_logo"],
        status: json["status"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() {
    var map = {
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
      "company_logo": companyLogo,
      "status": status,
      "date": date?.toIso8601String(),
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }
}
