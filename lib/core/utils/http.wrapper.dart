import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'package:http_parser/http_parser.dart';

import 'package:community_internal/app/constants.dart';

class HttpBuilder {
  static const bool isDebug = kDebugMode;
  static Future<http.Response?> get(
    String url, {
    bool includeToken = true,
    Map<String, dynamic>? queryParams,
    bool enableSnackBar = true,
  }) async {
    try {
      var headers = await getHeaders(includeToken);
      Uri uri = Uri.parse(Constants.baseUrl + url);
      if (queryParams != null) {
        uri = uri.replace(queryParameters: queryParams);
      }
      debugPrint("Uri is:$uri");
      var res = await http.get(
        uri,
        headers: headers,
      );
      debugPrint(
        '''
\n--------------------------------------------
Params : $queryParams,
Url:$uri,
headers:$headers
Body:${res.body}
StatusCode:${res.statusCode}
--------------------------------------------
''',
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        return res;
      } else {
        Map<String, dynamic> body =
            Map<String, dynamic>.from(jsonDecode(res.body));
        debugPrint("${body['message']}");
        if (enableSnackBar) {
          Fluttertoast.showToast(
            msg: "${body['message']}",
          );
        }
      }
    } on SocketException catch (e) {
      if (enableSnackBar) {
        Fluttertoast.showToast(
          msg: e.message,
        );
      }
    } catch (e) {
      if (enableSnackBar) {
        Fluttertoast.showToast(
          msg: kDebugMode ? "$e" : "Something went wrong",
        );
      }
    }
    return null;
  }

  static Future<http.Response?> post(
    String url, {
    bool includeToken = true,
    Map<String, dynamic>? body,
    bool showSnackbars = true,
    Map<String, dynamic>? headers,
  }) async {
    var reqHeaders = await getHeaders(includeToken);

    try {
      Uri uri = Uri.parse(
        Constants.baseUrl + url,
      );
      debugPrint("Uri is:$uri");
      var res = await http.post(
        uri,
        body: body == null ? null : jsonEncode(body),
        headers: headers ?? reqHeaders,
      );
      debugPrint(
        '''
\n--------------------------------------------
Body : $body,
Url:$uri,
StatusCode:${res.statusCode}
Body:${res.body}
--------------------------------------------
''',
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        return res;
      } else {
        Map<String, dynamic> body =
            Map<String, dynamic>.from(jsonDecode(res.body));
        debugPrint("${body['message']}");
        if (showSnackbars) {
          Fluttertoast.showToast(
            msg: "${body['message']}",
          );
        }
      }
    } on SocketException catch (e) {
      debugPrint("Socket Exception:$e");
      if (showSnackbars) {
        Fluttertoast.showToast(
          msg: e.message,
        );
      }
    } catch (e) {
      debugPrint("Exception: $e");
      if (showSnackbars) {
        Fluttertoast.showToast(
          msg: kDebugMode ? "$e" : "Something went wrong",
        );
      }
    }
    return null;
  }

  static Future<http.Response?> put(
    String url, {
    bool includeToken = true,
    Map<String, dynamic>? body,
    bool showSnackbars = true,
    Map<String, dynamic>? headers,
  }) async {
    try {
      var reqHeaders = await getHeaders(true);

      Uri uri = Uri.parse(
        Constants.baseUrl + url,
      );
      var res = await http.put(
        uri,
        body: body == null ? null : jsonEncode(body),
        headers: headers ?? reqHeaders,
      );
      debugPrint(
        '''
\n--------------------------------------------
Body : $body,
Url:$uri,
StatusCode:${res.statusCode}
Response Body:${res.body}
--------------------------------------------
''',
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        return res;
      } else {
        Map<String, dynamic> body =
            Map<String, dynamic>.from(jsonDecode(res.body));
        debugPrint("${body['message']}");
        if (showSnackbars) {
          Fluttertoast.showToast(
            msg: "${body['message']}",
          );
        }
      }
    } on SocketException catch (e) {
      debugPrint("$e");
      if (showSnackbars) {
        Fluttertoast.showToast(
          msg: e.message,
        );
      }
    } catch (e) {
      debugPrint("$e");
      if (showSnackbars) {
        Fluttertoast.showToast(
          msg: kDebugMode ? "$e" : "Something went wrong",
        );
      }
    }
    return null;
  }

  static Future getHeaders(bool includeToken) async {
    var headers = {
      "Accept": "application/json",
      "content-type": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Headers": "*",
      "Access-Control-Allow-Methods": "GET, POST, DELETE, OPTIONS",
    };
    return headers;
  }

  static String defaultError(String? error) {
    if (error != null && error != "") {
      return error;
    } else {
      return "Something went wrong";
    }
  }

  static Future<http.Response?> postFormData(
    String url, {
    required Map<String, String> body,
    required Uint8List image,
  }) async {
    Uri uri = Uri.parse(
      Constants.baseUrl + url,
    );

    var request = http.MultipartRequest("POST", uri);
    request.fields.addAll(body);
    request.fields['filename'] = 'image.jpeg';
    request.files.add(
      http.MultipartFile.fromBytes(
        'file',
        image,
        contentType: MediaType('image', 'jpeg'),
      ),
    );
    var streamRes = await request.send();
    var res = await http.Response.fromStream(streamRes);
    debugPrint(
      '''
\n--------------------------------------------
Body : ${res.body},
Url:$uri,
StatusCode:${res.statusCode}
--------------------------------------------
''',
    );
    if (res.statusCode == 200 || res.statusCode == 201) {
      Fluttertoast.showToast(
        msg: "Your art has been published successfully.",
      );
      return res;
    } else {
      Map<String, dynamic> body =
          Map<String, dynamic>.from(jsonDecode(res.body));
      debugPrint("${body['message']}");

      Fluttertoast.showToast(
        msg: "${body['message']}",
      );
    }
    return null;
  }
}
