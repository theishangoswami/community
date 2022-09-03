import 'package:community_internal/core/models/city.dart';
import 'package:community_internal/core/models/community.dart';
import 'package:community_internal/core/models/country.dart';
import 'package:community_internal/core/models/district.dart';
import 'package:community_internal/core/models/gotra.dart';
import 'package:community_internal/core/models/pincode.dart';
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
          child: DropdownButtonFormField<StateDetail>(
            validator: (value) =>
                value!.id == '-1' ? 'Please select a state' : null,
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
          child: DropdownButtonFormField<District>(
            validator: (value) =>
                value!.id == '-1' ? 'Please select a district' : null,
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

class CityProfileFieldDropDown extends StatefulWidget {
  final Icon icon;
  final List<City> cityList;
  final City selectedCity;
  final void Function(City?)? onChanged;
  const CityProfileFieldDropDown({
    Key? key,
    required this.icon,
    required this.cityList,
    required this.selectedCity,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CityProfileFieldDropDown> createState() =>
      _CityProfileFieldDropDownState();
}

class _CityProfileFieldDropDownState extends State<CityProfileFieldDropDown> {
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
          child: DropdownButtonFormField<City>(
            validator: (value) =>
                value!.id == '-1' ? 'Please select a city' : null,
            isExpanded: true,
            value: widget.selectedCity,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: widget.cityList
                .map(
                  (city) => DropdownMenuItem<City>(
                    value: city,
                    child: Text(city.cityName),
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

class PincodeProfileFieldDropDown extends StatefulWidget {
  final Icon icon;
  final List<Pincode> pincodeList;
  final Pincode selectedPincode;
  final void Function(Pincode?)? onChanged;
  const PincodeProfileFieldDropDown(
      {Key? key,
      required this.icon,
      required this.pincodeList,
      required this.selectedPincode,
      this.onChanged})
      : super(key: key);

  @override
  State<PincodeProfileFieldDropDown> createState() =>
      _PincodeProfileFieldDropDownState();
}

class _PincodeProfileFieldDropDownState
    extends State<PincodeProfileFieldDropDown> {
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
          child: DropdownButtonFormField<Pincode>(
            validator: (value) =>
                value!.id == '-1' ? 'Please select a pincode' : null,
            isExpanded: true,
            value: widget.selectedPincode,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: widget.pincodeList
                .map(
                  (pincode) => DropdownMenuItem<Pincode>(
                    value: pincode,
                    child: Text(pincode.pinCode),
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

class CommunityProfileFieldDropDown extends StatefulWidget {
  final Icon icon;
  final List<Community> communityList;
  final Community selectedCommunity;
  final void Function(Community?)? onChanged;
  const CommunityProfileFieldDropDown({
    Key? key,
    required this.icon,
    required this.communityList,
    required this.selectedCommunity,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CommunityProfileFieldDropDown> createState() =>
      _CommunityProfileFieldDropDownState();
}

class _CommunityProfileFieldDropDownState
    extends State<CommunityProfileFieldDropDown> {
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
          child: DropdownButtonFormField<Community>(
            validator: (value) =>
                value!.id == '-1' ? 'Please select a community' : null,
            isExpanded: true,
            value: widget.selectedCommunity,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: widget.communityList
                .map(
                  (community) => DropdownMenuItem<Community>(
                    value: community,
                    child: Text(community.communityName),
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

class CountryProfileFieldDropDown extends StatefulWidget {
  final Icon icon;
  final List<Country> countryList;
  final Country selectedCountry;
  final void Function(Country?)? onChanged;
  const CountryProfileFieldDropDown(
      {Key? key,
      required this.icon,
      required this.countryList,
      required this.selectedCountry,
      this.onChanged})
      : super(key: key);

  @override
  State<CountryProfileFieldDropDown> createState() =>
      _CountryProfileFieldDropDownState();
}

class _CountryProfileFieldDropDownState
    extends State<CountryProfileFieldDropDown> {
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
          child: DropdownButtonFormField<Country>(
            validator: (value) =>
                value!.id == '-1' ? 'Please select a country' : null,
            isExpanded: true,
            value: widget.selectedCountry,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: widget.countryList
                .map(
                  (country) => DropdownMenuItem<Country>(
                    value: country,
                    child: Text(country.countryName),
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

class GotraProfileFieldDropDown extends StatefulWidget {
  final Icon icon;
  final List<Gotra> gotraList;
  final Gotra selectedGotra;
  final void Function(Gotra?)? onChanged;
  const GotraProfileFieldDropDown(
      {Key? key,
      required this.icon,
      required this.gotraList,
      required this.selectedGotra,
      this.onChanged})
      : super(key: key);

  @override
  State<GotraProfileFieldDropDown> createState() =>
      _GotraProfileFieldDropDownState();
}

class _GotraProfileFieldDropDownState extends State<GotraProfileFieldDropDown> {
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
          child: DropdownButtonFormField<Gotra>(
            validator: (value) =>
                value!.id == '-1' ? 'Please select a gotra' : null,
            isExpanded: true,
            value: widget.selectedGotra,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: widget.gotraList
                .map(
                  (gotra) => DropdownMenuItem<Gotra>(
                    value: gotra,
                    child: Text(gotra.gotraName),
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
