// To parse this JSON data, do
//
//     final jobModel = jobModelFromJson(jsonString);

import 'dart:convert';

PostModel jobModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String jobModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel({
    this.id,
    required this.userId,
    required this.societyId,
    required this.typeOfPost,
    required this.postLink,
    this.postImage,
    required this.postDescription,
    required this.ads,
    required this.status,
    this.date,
  });

  final String? id;
  final String? userId;
  final String? societyId;
  final String? typeOfPost;
  final String? postLink;
  final String? postImage;
  final String? postDescription;
  final String? ads;
  final String? status;
  final DateTime? date;

  PostModel copyWith({
    String? id,
    String? userId,
    String? societyId,
    String? typeOfPost,
    String? postLink,
    String? postImage,
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
        postImage: postImage ?? this.postImage,
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
        postImage: json["post_image"],
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
        "post_image": postImage,
        "post_description": postDescription,
        "ads": ads,
        "status": status,
        "date": date?.toIso8601String(),
      };

  Map<String, dynamic> toPostMap() {
    var map = {
      "id": id,
      "user_id": userId,
      "society_id": societyId,
      "post_link": postLink,
      "type_post": typeOfPost,
      "post_links": postLink,
      "post_description": postDescription,
      "ads_id": ads,
      "status": status,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }
}
