import 'dart:convert';

import 'package:community_internal/app/locator.dart';
import 'package:community_internal/core/models/user_model.dart';
import 'package:community_internal/core/utils/http.wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final SharedPreferences _sharedPreferences = locator<SharedPreferences>();
  bool isUserLoggedIn() {
    return _sharedPreferences.containsKey('phoneNumber');
  }

  Future<bool> saveUser(String phoneNumber) async {
    try {
      var res = await HttpBuilder.get('user_id/$phoneNumber');
      if (res != null) {
        await _sharedPreferences.setString('phoneNumber', phoneNumber);
        await _sharedPreferences.setString(
          'currentUser',
          jsonEncode(jsonDecode(res.body)['resp'][0]),
        );
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  UserModel? getCurrentUser() {
    var user = _sharedPreferences.getString(
      'currentUser',
    );
    return user != null ? UserModel.fromJson(jsonDecode(user)) : null;
  }
}
