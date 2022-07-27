import 'dart:convert';

import 'package:community_internal/core/models/district.dart';
import 'package:community_internal/core/models/state_detail.dart';
import 'package:community_internal/core/models/user.model.dart';
import 'package:community_internal/core/utils/http.wrapper.dart';
import 'package:flutter/foundation.dart';

class UserRepository {
  Future<List<UserModel>> getAllUsers() async {
    try {
      var res = await HttpBuilder.get('users/view');
      if (res != null) {
        var body = jsonDecode(res.body)['result'] as List;
        return List<UserModel>.from(body.map((x) => UserModel.fromJson(x)));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return [];
  }

  Future<UserModel?> getUser(String id) async {
    try {
      var res = await HttpBuilder.get('single_user/view/$id');
      if (res != null) {
        var body = jsonDecode(res.body)['resp'] as List;
        if (body.isNotEmpty) {
          return UserModel.fromJson(body.first);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  Future<List<StateDetail>?> getState() async {
    try {
      var res = await HttpBuilder.get('state/view');
      if (res != null) {
        var body = jsonDecode(res.body)['result'] as List;
        if (body.isNotEmpty) {
          return List<StateDetail>.from(
            body.map((state) => StateDetail.fromJson(state)),
          );
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  Future<List<District>?> getDistrict() async {
    try {
      var res = await HttpBuilder.get('district/view');
      if (res != null) {
        var body = jsonDecode(res.body)['result'] as List;
        if (body.isNotEmpty) {
          return List<District>.from(
            body.map((district) => District.fromJson(district)),
          );
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  Future<void> updateUserProfile(UserModel userModel) async =>
      await HttpBuilder.post('user/update_profile', body: userModel.toJson());
}
