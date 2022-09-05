import 'dart:convert';

import 'package:community_internal/core/models/donation.dart';
import 'package:community_internal/core/models/expense.dart';
import 'package:community_internal/core/models/memberdetails.dart';
import 'package:community_internal/core/utils/http.wrapper.dart';
import 'package:community_internal/ui/screens/settings%20module/member_details.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LedgerRepository {
  Future<bool> addDonation(Map<String, dynamic> body) async {
    try {
      var res = await HttpBuilder.post(
        'https://www.akhilbhartiyasamaj.com/user/api/donation/add',
        baseUrl: false,
        body: body,
      );
      if (res!.statusCode == 200 || res.statusCode == 201) {
        print(res.body);
        return true;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return false;
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

  Future<List<Expense>?> getExpense(String societyId) async {
    try {
      var res = await HttpBuilder.get(
        'https://www.akhilbhartiyasamaj.com/user/api/expense_view_society_wise/$societyId',
        baseUrl: false,
      );
      if (res != null) {
        var body = jsonDecode(res.body)['resp'] as List;
        if (body.isNotEmpty) {
          return List<Expense>.from(body.map((x) => Expense.fromJson(x)));
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  Future<String?> getTotalDonation(String societyId) async {
    try {
      var res = await HttpBuilder.get(
          'https://www.akhilbhartiyasamaj.com/user/api/total_donation_view_society_wise/$societyId',
          baseUrl: false);
      if (res != null) {
        var body = jsonDecode(res.body)['resp'] as List;
        if (body.isNotEmpty) {
          return body[0]['total_donation'];
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  Future<String?> getTotalExpense(String societyId) async {
    try {
      var res = await HttpBuilder.get(
          'https://www.akhilbhartiyasamaj.com/user/api/total_expense_view_society_wise/$societyId',
          baseUrl: false);
      if (res != null) {
        var body = jsonDecode(res.body)['resp'] as List;
        if (body.isNotEmpty) {
          return body[0]['total_expnse_amount'];
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  Future<List<MemberDetails>?> getMemberDetails(String userId) async {
    try {
      var res = await HttpBuilder.get(
        'user/view_member/$userId',
      );
      if (res != null) {
        var body = jsonDecode(res.body)['result'] as List;
        if (body.isNotEmpty) {
          return List<MemberDetails>.from(
              body.map((member) => MemberDetails.fromJson(member)));
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return [];
  }

  Future<bool> addMember(Map<String, String> body) async {
    try {
      var res = await HttpBuilder.postFormData(
        'add_member',
        body: body,
        successMessage: 'Member Added Successfully',
      );
      if (res!.statusCode == 200 || res.statusCode == 201) {
        return true;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return false;
  }
}
