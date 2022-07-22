import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FilePickerService {
  Future<File?> pickImageFromCamera() async {
    try {
      var file = await ImagePicker().pickImage(source: ImageSource.camera);
      if (file != null) {
        return File(file.path);
      }
    } catch (e) {
      debugPrint("$e");
    }
    return null;
  }

  Future<File?> pickImageFromGallery() async {
    try {
      var file = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (file != null) {
        return File(file.path);
      }
    } catch (e) {
      debugPrint("$e");
    }
    return null;
  }

  Future<File?> pickVideo() async {
    try {
      var file = await ImagePicker().pickVideo(source: ImageSource.gallery);
      if (file != null) {
        return File(file.path);
      }
    } catch (e) {
      debugPrint("$e");
    }
    return null;
  }
}
