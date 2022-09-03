import 'package:community_internal/core/models/city.dart';
import 'package:community_internal/core/models/pincode.dart';
import 'package:flutter/material.dart';

showFilterSheet(
  BuildContext context, {
  Pincode? selectedPincode,
  Function(Pincode?)? onPinCodeChanged,
  List<Pincode>? pinCodeList,
  required bool showPinCodeField,
  City? selectedCity,
  Function(City?)? onCityChanged,
  List<City>? cityList,
  void Function()? applyOnPressed,
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    context: context,
    builder: (_) => GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Filter People'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              showPinCodeField
                  ? Expanded(
                      child: DropdownButtonFormField<Pincode>(
                        validator: (value) => value!.id == '-1'
                            ? 'Please select a pincode'
                            : null,
                        isExpanded: true,
                        value: selectedPincode,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: pinCodeList!
                            .map(
                              (pincode) => DropdownMenuItem<Pincode>(
                                value: pincode,
                                child: Text(pincode.pinCode),
                              ),
                            )
                            .toList(),
                        onChanged: onPinCodeChanged,
                      ),
                    )
                  : Expanded(
                      child: DropdownButtonFormField<City>(
                        validator: (value) =>
                            value!.id == '-1' ? 'Please select a city' : null,
                        isExpanded: true,
                        value: selectedCity,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: cityList!
                            .map(
                              (city) => DropdownMenuItem<City>(
                                value: city,
                                child: Text(city.cityName),
                              ),
                            )
                            .toList(),
                        onChanged: onCityChanged,
                      ),
                    ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                onPressed: applyOnPressed,
                child: const Text(
                  'Apply',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
