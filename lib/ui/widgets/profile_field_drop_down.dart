import 'package:flutter/material.dart';

class ProfileFieldDropDown extends StatefulWidget {
  final Icon icon;
  const ProfileFieldDropDown({Key? key, required this.icon}) : super(key: key);

  @override
  State<ProfileFieldDropDown> createState() => _ProfileFieldDropDownState();
}

class _ProfileFieldDropDownState extends State<ProfileFieldDropDown> {
  List<String> data = [
    "",
    "Name",
    "Phone Number",
    "Email",
    "State",
    "District",
    "Town",
    "Address",
    "Religion",
    "Aadhar card number",
    "Passport Number"
  ];
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
          child: DropdownButton(
            isExpanded: true,
            value: 'Name',
            icon: const Icon(Icons.keyboard_arrow_down),
            items: data
                .map(
                  (courseItem) => DropdownMenuItem(
                    value: courseItem,
                    child: Text(courseItem),
                  ),
                )
                .toList(),
            onChanged: (newValue) {},
          ),
        )
      ],
    );
  }
}
