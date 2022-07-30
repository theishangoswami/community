import 'dart:convert';

import 'package:community_internal/core/models/community.model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils/http.wrapper.dart';

class CommunityRepository {
  Future<List<CommunityModel>> getCommunityList(String communityId) async {
    try {
      var res = await HttpBuilder.get(
        'society/view/$communityId',
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

  Future<bool> updateJoinedSociety(
      {required Map<String, String> formBody}) async {
    try {
      final response = await HttpBuilder.postFormData(
        'select_society/add',
        body: formBody,
        successMessage: 'Successfully joined society',
      );
      if (response!.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
        return false;
      }
    }
    return false;
  }
}
