// To parse this JSON data, do
//
//     final commentModel = commentModelFromJson(jsonString);

import 'dart:convert';

CommentModel commentModelFromJson(String str) =>
    CommentModel.fromJson(json.decode(str));

String commentModelToJson(CommentModel data) => json.encode(data.toJson());

class CommentModel {
  CommentModel({
    this.id,
    required this.userId,
    required this.postId,
    required this.societyId,
    this.comment,
    this.status = 'enable',
  });

  final String? id;
  final String userId;
  final String postId;
  final String societyId;
  final String? comment;
  final String status;

  CommentModel copyWith({
    String? id,
    String? userId,
    String? postId,
    String? societyId,
    String? comment,
  }) =>
      CommentModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        postId: postId ?? this.postId,
        societyId: societyId ?? this.societyId,
        comment: comment ?? this.comment,
        status: status,
      );

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
      id: json["id"],
      userId: json["user_id"],
      postId: json["post_id"],
      societyId: json["society_id"],
      comment: json["comment"],
      status: json['status']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "post_id": postId,
        "society_id": societyId,
        "comment": comment,
        'status': status,
      };
}
