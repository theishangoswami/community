import 'dart:convert';

import 'package:community_internal/core/models/donation.dart';
import 'package:community_internal/core/utils/http.wrapper.dart';
import 'package:flutter/foundation.dart';

class LedgerRepository {
  Future<void> addDonation(Map<String, dynamic> body) async {
    try {
      var res = await HttpBuilder.post(
        'https://www.akhilbhartiyasamaj.com/user/api/donation/add',
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

  Future<List<Donation>?> getDonation(String societyId) async {
    try {
      var res = await HttpBuilder.get(
        'https://www.akhilbhartiyasamaj.com/user/api/donation_view_society_wise/$societyId',
        baseUrl: false,
      );
      if (res != null) {
        var body = jsonDecode(res.body)['resp'] as List;
        if (body.isNotEmpty) {
          return List<Donation>.from(body.map((x) => Donation.fromJson(x)));
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }
}
