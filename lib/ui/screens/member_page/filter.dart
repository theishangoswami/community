import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showFilterSheet(BuildContext context) {
  TextEditingController startDateInput = TextEditingController();
  TextEditingController endDateInput = TextEditingController();
  DateTime? endDate;
  DateTime? startDate;
  String datePeriod = '';

  showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (_) => StatefulBuilder(builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.close, size: 24)),
                    ),
                    Text(
                      "Filter People".toUpperCase(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Select City".toUpperCase(),
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButtonFormField<String>(
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 4.0),
                            child: Icon(Icons.keyboard_arrow_down_outlined),
                          ),
                          items: [
                            'DELHI',
                            'MUMBAI',
                            'GUJRAT',
                          ]
                              .map((e) =>
                                  DropdownMenuItem(child: Text(e), value: e))
                              .toList(),
                          onChanged: (startDate != null || endDate != null)
                              ? null
                              : (value) {
                                  setState(() {
                                    datePeriod = value!;
                                  });
                                }),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Select Pincode".toUpperCase(),
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButtonFormField<String>(
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 4.0),
                            child: Icon(Icons.keyboard_arrow_down_outlined),
                          ),
                          items: [
                            '202010',
                            '201010',
                            '201045',
                          ]
                              .map((e) =>
                                  DropdownMenuItem(child: Text(e), value: e))
                              .toList(),
                          onChanged: (startDate != null || endDate != null)
                              ? null
                              : (value) {
                                  setState(() {
                                    datePeriod = value!;
                                  });
                                }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: FlatButton(
                          color: Colors.amber,
                          onPressed: () {},
                          child: Text("Apply filter")),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom))
                  ]),
            );
          }));
}
