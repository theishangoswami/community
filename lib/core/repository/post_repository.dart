import 'dart:convert';

import 'package:community_internal/core/utils/http.wrapper.dart';
import 'package:flutter/material.dart';

import '../models/post.model.dart';

class PostRepository {
  Future<List<PostModel>> getPosts() async {
    try {
      var res = await HttpBuilder.get('community/view');
      if (res != null) {
        var body = jsonDecode(res.body)['result'];
        return body.map<PostModel>((json) => PostModel.fromJson(json)).toList();
      }
    } catch (e) {
      debugPrint("$e");
    }
    return [];
  }
}
