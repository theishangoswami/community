import 'dart:convert';
import 'dart:typed_data';

import 'package:community_internal/core/models/job.model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../app/constants.dart';
import '../utils/http.wrapper.dart';
import 'package:http_parser/http_parser.dart';

class JobRepository {
  Future<List<JobModel>> getAllJobs() async {
    try {
      var res = await HttpBuilder.get('jobs/view');
      if (res != null) {
        var body = jsonDecode(res.body)['result'] as List;
        return List<JobModel>.from(body.map((x) => JobModel.fromJson(x)));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return [];
  }

  Future<bool> applyJob(String jobId, String userId) async {
    try {
      var res = await HttpBuilder.get('jobs/apply/$jobId/$userId');
      if (res!.statusCode == 200) {
        var body = jsonDecode(res.body)['message'];
        Fluttertoast.showToast(msg: body);
        return true;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return false;
  }

  Future<bool> postJob(Map<String, String> formBody, image) async {
    try {
      final res = await HttpBuilder.postFormData('jobs/add',
          body: formBody,
          image: image,
          imageParameterName: 'company_logo',
          successMessage: "Job posted successfully.");
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
