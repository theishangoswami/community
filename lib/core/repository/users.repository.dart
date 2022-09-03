import 'dart:convert';

import 'package:community_internal/core/models/city.dart';
import 'package:community_internal/core/models/community.dart';
import 'package:community_internal/core/models/country.dart';
import 'package:community_internal/core/models/district.dart';
import 'package:community_internal/core/models/gotra.dart';
import 'package:community_internal/core/models/pincode.dart';
import 'package:community_internal/core/models/state_detail.dart';
import 'package:community_internal/core/models/user_model.dart';
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

  Future<List<City>?> getCity() async {
    try {
      var res = await HttpBuilder.get('city/view');
      if (res != null) {
        var body = jsonDecode(res.body)['result'] as List;
        if (body.isNotEmpty) {
          return List<City>.from(
            body.map((city) => City.fromJson(city)),
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

  Future<List<Pincode>?> getPincode() async {
    try {
      var res = await HttpBuilder.get('pincode/view');
      if (res != null) {
        var body = jsonDecode(res.body)['result'] as List;
        if (body.isNotEmpty) {
          return List<Pincode>.from(
            body.map((pincode) => Pincode.fromJson(pincode)),
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

  Future<List<Community>?> getCommunity() async {
    try {
      var res = await HttpBuilder.get('community/view');
      if (res != null) {
        var body = jsonDecode(res.body)['result'] as List;
        if (body.isNotEmpty) {
          return List<Community>.from(
            body.map((community) => Community.fromJson(community)),
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

  Future<List<Country>?> getCountry() async {
    try {
      var res = await HttpBuilder.get('country/view');
      if (res != null) {
        var body = jsonDecode(res.body)['result'] as List;
        if (body.isNotEmpty) {
          return List<Country>.from(
            body.map((country) => Country.fromJson(country)),
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

  Future<List<Gotra>?> getGotra() async {
    try {
      var res = await HttpBuilder.get('gotra/view');
      if (res != null) {
        var body = jsonDecode(res.body)['result'] as List;
        if (body.isNotEmpty) {
          return List<Gotra>.from(
            body.map((gotra) => Gotra.fromJson(gotra)),
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

  Future<List<UserModel>?> getSearchedUser(String searchQuery) async {
    try {
      var res = await HttpBuilder.get('user_filter/view/$searchQuery');
      if (res != null) {
        var body = jsonDecode(res.body)['resp'] as List;
        if (body.isNotEmpty) {
          print('Result: $body');
          return List<UserModel>.from(
            body.map((user) => UserModel.fromJson(user)),
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

  Future<void> userRegistration(Map<String, String> formBody, image) async {
    try {
      await HttpBuilder.postFormData('first_user/registation',
          body: formBody,
          image: image,
          imageParameterName: 'profile',
          successMessage: "Your details have been updated.");
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> updateUserProfile(Map<String, String> formBody, image) async {
    try {
      await HttpBuilder.postFormData('user/update_profile',
          body: formBody,
          image: image,
          imageParameterName: 'profile',
          successMessage: "Your details have been updated.");
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
