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

  Future<bool> createJob(JobModel jobModel, Uint8List image) async {
    try {
      Dio dio = Dio();
      var formData = FormData.fromMap({
        ...jobModel.toJson(),
        'company_logo': MultipartFile.fromBytes(
          image,
          filename: 'company_logo',
          contentType: MediaType('image', 'jpeg'),
        ),
      });
      var response = await dio.post(
        Constants.baseUrl + "jobs/add",
        data: formData,
      );

      Fluttertoast.showToast(msg: response.data.toString());
      return response.statusCode == 200;
    } on DioError catch (e) {
      Fluttertoast.showToast(msg: e.message);
    } catch (e) {
      debugPrint("$e");
    }
    return false;
  }
}
