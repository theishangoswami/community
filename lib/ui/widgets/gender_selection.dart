import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({Key? key}) : super(key: key);

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String _selectedGender = 'male';
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
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value!;
                  });
                },
              ),
              const Text("MALE"),
              const SizedBox(
                width: 70,
              ),
              Radio<String>(
                value: 'female',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value!;
                  });
                },
              ),
              const Text('FEMALE'),
            ],
          )
        ],
      ),
    );
  }
}
