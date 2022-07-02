import 'dart:convert';

import 'package:community_internal/core/models/job.model.dart';
import 'package:flutter/foundation.dart';

import '../utils/http.wrapper.dart';

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

  Future<bool> createJob(JobModel jobModel) async {
    try {
      Uri uri =
          Uri.parse('jobs/add').replace(queryParameters: jobModel.toJson());
      return (await HttpBuilder.post(uri.toString())) != null;
    } catch (e) {
      debugPrint("$e");
    }
    return false;
  }
}
