import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel({
    required this.id,
    required this.userId,
    required this.societyId,
    required this.typeOfPost,
    required this.postLink,
    required this.postDescription,
    required this.ads,
    required this.status,
    required this.date,
  });

  final String id;
  final String userId;
  final String societyId;
  final String typeOfPost;
  final String postLink;
  final String postDescription;
  final String ads;
  final String status;
  final DateTime date;

  PostModel copyWith({
    String? id,
    String? userId,
    String? societyId,
    String? typeOfPost,
    String? postLink,
    String? postDescription,
    String? ads,
    String? status,
    DateTime? date,
  }) =>
      PostModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        societyId: societyId ?? this.societyId,
        typeOfPost: typeOfPost ?? this.typeOfPost,
        postLink: postLink ?? this.postLink,
        postDescription: postDescription ?? this.postDescription,
        ads: ads ?? this.ads,
        status: status ?? this.status,
        date: date ?? this.date,
      );

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["id"],
        userId: json["user_id"],
        societyId: json["society_id"],
        typeOfPost: json["type_of_post"],
        postLink: json["post_link"],
        postDescription: json["post_description"],
        ads: json["ads"],
        status: json["status"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "society_id": societyId,
        "type_of_post": typeOfPost,
        "post_link": postLink,
        "post_description": postDescription,
        "ads": ads,
        "status": status,
        "date": date.toIso8601String(),
      };
}
