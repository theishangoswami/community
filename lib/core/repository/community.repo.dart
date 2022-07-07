import 'dart:convert';

import 'package:community_internal/core/models/community.model.dart';
import 'package:flutter/material.dart';

import '../utils/http.wrapper.dart';

class CommunityRepository {
  Future<List<CommunityModel>> getCommunityList() async {
    try {
      var res = await HttpBuilder.get(
        'society/view',
      );
      if (res != null) {
        var body = jsonDecode(res.body)['result'];
        return body
            .map<CommunityModel>((e) => CommunityModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      debugPrint("$e");
    }
    return [];
  }
}
