import 'dart:io';

import 'package:community_internal/core/services/file.service.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  File? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Align(
            alignment: Alignment.topLeft,
            child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.black,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 67,
                backgroundImage: _selectedImage?.path.isNotEmpty ?? false
                    ? Image.file(_selectedImage!).image
                    : const NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjzKgGevOlmVCQ_ROMb5GhVGn-8bCG2ncUNA&usqp=CAU",
                      ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 85, horizontal: 130),
          child: InkWell(
            onTap: () {
              final FilePickerService _filePickerService = FilePickerService();
              final pickedImage = _filePickerService.pickImageFromGallery();
              pickedImage.then((value) {
                if (value?.path.isNotEmpty ?? false) {
                  setState(() {
                    _selectedImage = value;
                  });
                }
              });
            },
            child: const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.edit,
                  size: 20,
                  color: Colors.white,
                )),
          ),
        ),
      ],
    );
  }
}
