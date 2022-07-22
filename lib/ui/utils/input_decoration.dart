import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(
  String labelText,
  String hintText,
  Icon? icon,
) {
  return InputDecoration(
    focusColor: Colors.yellow,
    suffixIcon: icon,
    fillColor: Colors.white,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color:Color(0xFF5A3FCE),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2.0,
      ),
    ),
    labelText: labelText,
    labelStyle: const TextStyle(
      color: Colors.black87,
    ),
    suffixIconColor: Colors.yellow,
    iconColor: Colors.yellow,
    hintText: hintText,

    // suffixIcon: IconButton(
    //   icon: Icon(
    //     _passwordVisible ? Icons.visibility : Icons.visibility_off,
    //     color: Theme.of(context).primaryColorDark,
    //   ),
    //   onPressed: () {
    //     setState(() {
    //       _passwordVisible = !_passwordVisible;
    //     });
    //   },
    // ),
  );
}
