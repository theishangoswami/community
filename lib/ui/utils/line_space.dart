import 'package:flutter/material.dart';

class LineSpace extends StatelessWidget {
  const LineSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 10.0,
      width: double.infinity,
      child: Divider(
        color: Colors.black,
        thickness: 0.1,
      ),
    );
  }
}
