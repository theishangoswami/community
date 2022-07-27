import 'package:community_internal/core/models/district.dart';
import 'package:community_internal/core/models/state_detail.dart';
import 'package:flutter/material.dart';

class StateProfileFieldDropDown extends StatefulWidget {
  final Icon icon;
  final List<StateDetail> stateList;
  final StateDetail selectedState;
  final void Function(StateDetail?)? onChanged;
  const StateProfileFieldDropDown({
    Key? key,
    required this.icon,
    required this.stateList,
    this.onChanged,
    required this.selectedState,
  }) : super(key: key);

  @override
  State<StateProfileFieldDropDown> createState() =>
      _StateProfileFieldDropDownState();
}

class _StateProfileFieldDropDownState extends State<StateProfileFieldDropDown> {
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
          child: DropdownButton<StateDetail>(
            isExpanded: true,
            value: widget.selectedState,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: widget.stateList
                .map(
                  (state) => DropdownMenuItem<StateDetail>(
                    value: state,
                    child: Text(state.stateName),
                  ),
                )
                .toList(),
            onChanged: widget.onChanged,
          ),
        )
      ],
    );
  }
}

class DistrictProfileFieldDropDown extends StatefulWidget {
  final Icon icon;
  final List<District> districtList;
  final District selectedDistrict;
  final void Function(District?)? onChanged;
  const DistrictProfileFieldDropDown({
    Key? key,
    required this.icon,
    required this.districtList,
    required this.selectedDistrict,
    this.onChanged,
  }) : super(key: key);

  @override
  State<DistrictProfileFieldDropDown> createState() =>
      _DistrictProfileFieldDropDownState();
}

class _DistrictProfileFieldDropDownState
    extends State<DistrictProfileFieldDropDown> {
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
          child: DropdownButton<District>(
            isExpanded: true,
            value: widget.selectedDistrict,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: widget.districtList
                .map(
                  (district) => DropdownMenuItem<District>(
                    value: district,
                    child: Text(district.districtName),
                  ),
                )
                .toList(),
            onChanged: widget.onChanged,
          ),
        )
      ],
    );
  }
}
