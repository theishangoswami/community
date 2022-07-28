import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileTextFeild extends StatefulWidget {
  final Icon icon;
  final String displaytText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  const ProfileTextFeild({
    Key? key,
    required this.icon,
    required this.displaytText,
    required this.controller,
    required this.keyboardType,
    this.validator,
    this.inputFormatters,
  }) : super(key: key);

  @override
  State<ProfileTextFeild> createState() => _ProfileTextFeildState();
}

class _ProfileTextFeildState extends State<ProfileTextFeild> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 70,
          width: 30,
          decoration: const BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(3),
            ),
          ),
          child: widget.icon,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.displaytText.toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
              TextFormField(
                inputFormatters: widget.inputFormatters,
                validator: widget.validator,
                controller: widget.controller,
                keyboardType: widget.keyboardType,
              ),
            ],
          ),
        )
      ],
    );
  }
}
