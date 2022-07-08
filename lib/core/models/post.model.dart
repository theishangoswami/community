// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel({
    this.id,
    required this.userId,
    required this.societyId,
    required this.typeOfPost,
    required this.postLink,
    required this.postDescription,
    required this.ads,
    this.status,
    this.date,
  });

  final String? id;
  final String? userId;
  final String? societyId;
  final String? typeOfPost;
  final dynamic postLink;
  final String? postDescription;
  final String? ads;
  final String? status;
  final String? date;

  PostModel copyWith({
    String? id,
    String? userId,
    String? societyId,
    String? typeOfPost,
    String? postLink,
    String? postDescription,
    String? ads,
    String? status,
    String? date,
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
        date: (json["date"]),
      );

  Map<String, dynamic> toJson() {
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
