import 'dart:io';
import 'package:flutter/material.dart';

class ProfileImage extends StatefulWidget {
  final File? selectedImage;
  final void Function()? onTap;
  final String? imageUrl;
  const ProfileImage({
    Key? key,
    required this.selectedImage,
    this.onTap,
    this.imageUrl,
  }) : super(key: key);

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
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
                backgroundImage: widget.selectedImage?.path.isNotEmpty ?? false
                    ? Image.file(widget.selectedImage!).image
                    : NetworkImage(
                        widget.imageUrl?.isEmpty ?? true
                            ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjzKgGevOlmVCQ_ROMb5GhVGn-8bCG2ncUNA&usqp=CAU"
                            : widget.imageUrl!,
                      ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 85, horizontal: 130),
          child: InkWell(
            onTap: widget.onTap,
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
