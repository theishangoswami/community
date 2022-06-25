import 'dart:convert';

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
}
