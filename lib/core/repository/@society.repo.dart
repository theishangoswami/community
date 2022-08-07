import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';
import 'package:community_internal/app/constants.dart';
import 'package:community_internal/core/models/@society.model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http_parser/http_parser.dart';
import '../utils/http.wrapper.dart';

class SocietyRepository {
  Future<List<SocietyModel>> getSocietyList() async {
    try {
      var res = await HttpBuilder.get(
        'society/view',
      );
      if (res != null) {
        var body = jsonDecode(res.body)['result'];
        return body.map<SocietyModel>((e) => SocietyModel.fromJson(e)).toList();
      }
    } catch (e) {
      debugPrint("$e");
    }
    return [];
  }

  Future<bool> addSociety(
      SocietyModel societyModel, Uint8List societyLogo) async {
    try {
      Dio dio = Dio();
      var formData = FormData.fromMap({
        ...societyModel.toJson(),
        'societyLogo': MultipartFile.fromBytes(
          societyLogo,
          filename: 'societyLogo',
          contentType: MediaType('image', 'jpeg'),
        ),
      });
      var response = await dio.post(
        "${Constants.baseUrl}soceity/add",
        data: formData,
      );
      debugPrint(
          "Society add response:${response.data}\nUrl:${response.realUri}");
      return response.statusCode == 200;
    } on DioError catch (e) {
      debugPrint("Dio error :$e");
      Fluttertoast.showToast(msg: e.message);
    } catch (e) {
      debugPrint("$e");
    }
    return false;
  }
}
