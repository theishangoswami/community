import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  final String selectedGender;
  final void Function(String?)? onChanged;
  const GenderSelection({
    Key? key,
    required this.selectedGender,
    this.onChanged,
  }) : super(key: key);

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 37),
            child: Text(' GENDER:'),
          ),
          Row(
            children: [
              const SizedBox(
                width: 24,
              ),
              Radio<String>(
                value: 'male',
                groupValue: widget.selectedGender,
                onChanged: widget.onChanged,
              ),
              const Text("MALE"),
              const SizedBox(
                width: 70,
              ),
              Radio<String>(
                value: 'female',
                groupValue: widget.selectedGender,
                onChanged: widget.onChanged,
              ),
              const Text('FEMALE'),
            ],
          )
        ],
      ),
    );
  }
}
