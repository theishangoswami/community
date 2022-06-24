import 'dart:convert';

import 'package:community_internal/core/models/comment.model.dart';
import 'package:community_internal/core/models/like.model.dart';
import 'package:community_internal/core/utils/http.wrapper.dart';
import 'package:flutter/material.dart';

import '../models/post.model.dart';

class PostRepository {
  Future<List<PostModel>> getPosts() async {
    try {
      var res = await HttpBuilder.get('social_media_post/view');
      if (res != null) {
        var body = jsonDecode(res.body)['result'];
        return body.map<PostModel>((json) => PostModel.fromJson(json)).toList();
      }
    } catch (e) {
      debugPrint("$e");
    }
    return [];
  }

  Future<List<LikeModel>> fetchLikes(String id) async {
    try {
      var res = await HttpBuilder.get(
        'likes/view/$id',
        enableSnackBar: false,
      );
      if (res != null) {
        var body = jsonDecode(res.body)['resp'];
        return body.map<LikeModel>((json) => LikeModel.fromJson(json)).toList();
      }
    } catch (e) {
      debugPrint("$e");
    }
    return [];
  }

  Future<List<CommentModel>> fetchComments(String id) async {
    try {
      var res = await HttpBuilder.get(
        'comment/view/$id',
        enableSnackBar: false,
      );
      if (res != null) {
        var body = jsonDecode(res.body)['resp'];
        return body
            .map<CommentModel>((json) => CommentModel.fromJson(json))
            .toList();
      }
    } catch (e) {
      debugPrint("$e");
    }
    return [];
  }
}
