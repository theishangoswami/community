import 'package:community_internal/core/utils/http.wrapper.dart';
import 'package:flutter/cupertino.dart';

class AuthRepository {
  Future<bool> sendOtp(String phoneNumber) async {
    try {
      return await HttpBuilder.post(
            'user/register?mobile_number=$phoneNumber',
          ) !=
          null;
    } catch (e) {
      debugPrint("$e");
    }
    return false;
  }

  Future<bool> verifyOtp(String phoneNumber, String otp) async {
    try {
      return await HttpBuilder.post(
            'user/registration_otp?mobile_number=$phoneNumber&otp=$otp',
          ) !=
          null;
    } catch (e) {
      debugPrint("$e");
    }
    return false;
  }
}
