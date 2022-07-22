import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key, required this.radius, this.imgUrl})
      : super(key: key);
  final double radius;
  final String? imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Container(
        width: radius - 8,
        height: radius - 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: imgUrl == null
                ? const AssetImage(
                    'assets/images/user-icon.jpg',
                  )
                : Image.network(imgUrl!).image,
          ),
        ),
      ),
    );
  }
}
