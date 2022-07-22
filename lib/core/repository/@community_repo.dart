import 'dart:convert';
import 'package:community_internal/core/models/community.model.dart';
import 'package:flutter/foundation.dart';
import '../utils/http.wrapper.dart';

class CommunityRepository {
  Future<List<CommunityModel>> getCommunityList() async {
    try {
      var res = await HttpBuilder.get('community/view');
      if (res != null) {
        var body = jsonDecode(res.body)['result'] as List;
        return List<CommunityModel>.from(
            body.map((x) => CommunityModel.fromJson(x)));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return [];
  }
}
