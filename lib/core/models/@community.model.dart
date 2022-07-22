import 'dart:convert';

class CommunityModel {
  CommunityModel({
    required this.id,
    required this.communityTitle,
    required this.status,
  });

  final String? id;
  final String? communityTitle;
  final String? status;

  CommunityModel copyWith({
    String? id,
    String? communityTitle,
    String? status,
  }) =>
      CommunityModel(
        id: id ?? this.id,
        communityTitle: communityTitle ?? this.communityTitle,
        status: status ?? this.status,
      );

  factory CommunityModel.fromJson(String str) =>
      CommunityModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommunityModel.fromMap(Map<String, dynamic> json) => CommunityModel(
        id: json["id"],
        communityTitle: json["community_title"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "community_title": communityTitle,
        "status": status,
      };
}
