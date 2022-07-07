import 'dart:convert';
import 'dart:typed_data';

import 'package:community_internal/app/constants.dart';
import 'package:community_internal/core/models/comment.model.dart';
import 'package:community_internal/core/models/like.model.dart';
import 'package:community_internal/core/utils/http.wrapper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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

  Future<bool> createPost(PostModel postModel, {Uint8List? image}) async {
    try {
      Uri uri = Uri.parse('social_media_post/add')
          .replace(queryParameters: postModel.toJson());
      var res = (await HttpBuilder.post(uri.toString()));
      print("Response is:${res?.body}");

      return res != null;
    } catch (e) {}
    return false;
  }

  Future<bool> addImage(String postId, Uint8List image) async {
    try {
      var request = http.MultipartRequest(
        "POST",
        Uri.parse(Constants.baseUrl + "social_media_post_image/add"),
      );

      request.fields['post_id'] = postId;
      request.files
          .add(http.MultipartFile.fromBytes("post_links_images", image));

      var sendRequest = await request.send();
      var response = await http.Response.fromStream(sendRequest);
      final responseData = json.decode(response.body);
      print(responseData);
      return response.statusCode == 200;
    } catch (e) {}
    return false;
  }
}
