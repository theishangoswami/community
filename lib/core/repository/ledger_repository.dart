import 'dart:convert';

import 'package:community_internal/core/utils/http.wrapper.dart';
import 'package:flutter/foundation.dart';

class LedgerRepository {
  Future<void> addDonation(Map<String, dynamic> body) async {
    try {
      var res = await HttpBuilder.post(
        'https://mydemoweb.online/community_app/user/api/donation/add',
        baseUrl: false,
        body: body,
      );
      if (res != null) {
        print(res.body);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
