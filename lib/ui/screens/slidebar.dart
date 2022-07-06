import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Sky { Donations, Expenses }

Map<Sky, Color> skyColors = <Sky, Color>{
  Sky.Donations: Color(0xFFFFFFFF),
  Sky.Expenses: Color(0xFFFFFFFF),
};

class SegmentedControlSample extends StatefulWidget {
  const SegmentedControlSample({Key? key}) : super(key: key);

  @override
  State<SegmentedControlSample> createState() => _SegmentedControlSampleState();
}

class _SegmentedControlSampleState extends State<SegmentedControlSample> {
  Sky _selectedSegment = Sky.Donations;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: skyColors[_selectedSegment],
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: CupertinoSlidingSegmentedControl<Sky>(
          backgroundColor: CupertinoColors.systemGrey2,
          thumbColor: skyColors[_selectedSegment]!,
          groupValue: _selectedSegment,
          onValueChanged: (Sky? value) {
            if (value != null) {
              setState(() {
                _selectedSegment = value;
              });
            }
          },
          children: const <Sky, Widget>{
            Sky.Donations: Padding(
              padding: EdgeInsets.symmetric(horizontal: 13, vertical: 5),
              child: Text(
                'Donations',
                style: TextStyle(color: CupertinoColors.black),
              ),
            ),
            Sky.Expenses: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                'Expenses',
                style: TextStyle(color: CupertinoColors.black),
              ),
            ),
          },
        ),
      ),
      child: _selectedSegment == Sky.Donations?Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 370,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Card(
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ListTile(
                                leading: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Donation Received".toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500)),
                                    Text("By Nihal ji".toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400)),
                                    Text("12 June".toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                                trailing: Column(
                                  children: [
                                    Text("₹ 300".toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ));
                  }),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: 160,
                        child: Center(
                            child: Text(
                              "Recieved Donation".toUpperCase(),
                              style: const TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            )),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      // Container(
                      //   height: 50,
                      //   width: 160,
                      //   child: Center(
                      //       child: Text(
                      //         "Bill Paid".toUpperCase(),
                      //         style: const TextStyle(
                      //             color: Colors.amber,
                      //             fontWeight: FontWeight.bold,
                      //             fontSize: 14),
                      //       )),
                      //   decoration: BoxDecoration(
                      //     color: Colors.black,
                      //     borderRadius: BorderRadius.circular(20),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ):Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 370,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Card(
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ListTile(
                                leading: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Expenses spent".toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500)),
                                    Text("By ishan ji".toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400)),
                                    Text("17 August".toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                                trailing: Column(
                                  children: [
                                    Text("₹ 20".toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ));
                  }),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: 160,
                        child: Center(
                            child: Text(
                              "Paid Expenses".toUpperCase(),
                              style: const TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            )),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      // Container(
                      //   height: 50,
                      //   width: 160,
                      //   child: Center(
                      //       child: Text(
                      //         "Expenses Details".toUpperCase(),
                      //         style: const TextStyle(
                      //             color: Colors.amber,
                      //             fontWeight: FontWeight.bold,
                      //             fontSize: 14),
                      //       )),
                      //   decoration: BoxDecoration(
                      //     color: Colors.black,
                      //     borderRadius: BorderRadius.circular(20),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// child: Center(
// child: Text(
// 'Selected Segment: ${_selectedSegment.name}',
// style: const TextStyle(color: CupertinoColors.white),
// ),
// ),
