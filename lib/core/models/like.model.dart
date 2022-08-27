// To parse this JSON data, do
//
//     final likeModel = likeModelFromJson(jsonString);

import 'dart:convert';

LikeModel likeModelFromJson(String str) => LikeModel.fromJson(json.decode(str));

String likeModelToJson(LikeModel data) => json.encode(data.toJson());

class LikeModel {
  LikeModel({
    this.id,
    required this.postId,
    required this.soceityId,
    required this.userId,
  });

  final String? id;
  final String postId;
  final String soceityId;
  final String userId;

  LikeModel copyWith({
    String? id,
    String? postId,
    String? soceityId,
    String? userId,
  }) =>
      LikeModel(
        id: id ?? this.id,
        postId: postId ?? this.postId,
        soceityId: soceityId ?? this.soceityId,
        userId: userId ?? this.userId,
      );

  factory LikeModel.fromJson(Map<String, dynamic> json) => LikeModel(
        id: json["id"],
        postId: json["post_id"],
        soceityId: json["soceity_id"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "post_id": postId,
        "soceity_id": soceityId,
        "user_id": userId,
      };
}
