import 'package:community_internal/core/models/donation.dart';
import 'package:community_internal/ui/screens/ledger%20module/other_community.dart';
import 'package:community_internal/ui/screens/ledger%20module/same_community.dart';
import 'package:community_internal/ui/screens/ledger%20module/same_ex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
// import 'package:community_internal/ui/screens/d.dart';
// import 'package:community_internal/ui/screens/expense.dart';
// import 'package:community_internal/ui/screens/other_community.dart';
// import 'package:community_internal/ui/screens/same_community.dart';
// import 'package:community_internal/ui/screens/same_ex.dart';
// import 'package:flutter_speed_dial/flutter_speed_dial.dart';
// import 'package:readmore/readmore.dart';

// import 'other_ex.dart';

enum Sky { Donations, Expenses }

Map<Sky, Color> skyColors = <Sky, Color>{
  Sky.Donations: Color(0xFFFFFFFF),
  Sky.Expenses: Color(0xFFFFFFFF),
};

class SegmentedControlSample extends StatefulWidget {
  final List<Donation>? donationList;
  const SegmentedControlSample({Key? key, this.donationList}) : super(key: key);

  @override
  State<SegmentedControlSample> createState() => _SegmentedControlSampleState();
}

class _SegmentedControlSampleState extends State<SegmentedControlSample>
    with TickerProviderStateMixin<SegmentedControlSample> {

  bool v = true;
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
      child: _selectedSegment == Sky.Donations
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  v == true
                      ? Container(
                          color: Colors.white,
                          height: 370,
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: widget.donationList!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Card(
                                        elevation: 4,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: ListTile(
                                            leading: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceEvenly,
                                              children: [
                                                Text(
                                                    "Donation Received"
                                                        .toUpperCase(),
                                                    style: const TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                Text(
                                                    "By ${widget.donationList![index].name} ji"
                                                        .toUpperCase(),
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                Text(
                                                    DateFormat('d LLLL')
                                                        .format(
                                                            DateTime.parse(
                                                                widget.donationList![
                                                                        index]
                                                                    .date))
                                                        .toUpperCase(),
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                              ],
                                            ),
                                            trailing: Column(
                                              children: [
                                                Text(
                                                    "₹ ${widget.donationList![index].amount}"
                                                        .toUpperCase(),
                                                    style: const TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ));
                              }),
                        )
                      : Container(
                          color: Colors.white,
                          height: 800,
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: widget.donationList!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Card(
                                        elevation: 4,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: ListTile(
                                            leading: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceEvenly,
                                              children: [
                                                Text(
                                                    "Donation Received"
                                                        .toUpperCase(),
                                                    style: const TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                Text(
                                                    "By ${widget.donationList![index].name} ji"
                                                        .toUpperCase(),
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                Text(
                                                    DateFormat('d LLLL')
                                                        .format(
                                                            DateTime.parse(
                                                                widget.donationList![
                                                                        index]
                                                                    .date))
                                                        .toUpperCase(),
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                              ],
                                            ),
                                            trailing: Column(
                                              children: [
                                                Text(
                                                    "₹ ${widget.donationList![index].amount}"
                                                        .toUpperCase(),
                                                    style: const TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ));
                              }),
                        ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          v = !v;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 17),
                        child: Text(
                          v == true ? "SEE MORE..." : "SEE LESS...",
                          style: TextStyle(fontSize: 18),
                        ),
                      )),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => HomeP()),
                                // );
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    // height: 50,
                                    // width: 160,
                                    child: SpeedDial(
                                        child: Icon(
                                          Icons.add,
                                          size: 30,
                                        ),
                                        spacing: 20,
                                        elevation: 0,
                                        buttonSize: Size(70, 70),
                                        backgroundColor: Colors.transparent,
                                        children: [
                                          SpeedDialChild(
                                            child: const Icon(Icons.face),
                                            label: 'YOUR COMMUNITY',
                                            backgroundColor:
                                                Colors.amberAccent,
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SameCom()),
                                              );
                                            },
                                          ),
                                          SpeedDialChild(
                                            child: const Icon(Icons.face),
                                            label: 'OTHER COMMUNITY',
                                            backgroundColor:
                                                Colors.amberAccent,
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        OtherCom()),
                                              );
                                            },
                                          ),
                                        ]),
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(
                                  //       vertical: 18, horizontal: 30),
                                  //   child: Text(
                                  //     "Get Donation".toUpperCase(),
                                  //     style: const TextStyle(
                                  //       color: Colors.black,
                                  //       fontWeight: FontWeight.bold,
                                  //       fontSize: 14,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
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
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  v == true
                      ? Container(
                          color: Colors.white,
                          height: 370,
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 4,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Card(
                                        elevation: 4,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: ListTile(
                                            leading: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceEvenly,
                                              children: [
                                                Text(
                                                    "Expenses spent"
                                                        .toUpperCase(),
                                                    style: const TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                Text(
                                                    "By ishan ji"
                                                        .toUpperCase(),
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                Text(
                                                    "17 August".toUpperCase(),
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                              ],
                                            ),
                                            trailing: Column(
                                              children: [
                                                Text("₹ 20".toUpperCase(),
                                                    style: const TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ));
                              }),
                        )
                      : Container(
                          color: Colors.white,
                          height: 800,
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 9,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Card(
                                        elevation: 4,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: ListTile(
                                            leading: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceEvenly,
                                              children: [
                                                Text(
                                                    "Expenses spent"
                                                        .toUpperCase(),
                                                    style: const TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                Text(
                                                    "By ishan ji"
                                                        .toUpperCase(),
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                Text(
                                                    "17 August".toUpperCase(),
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                              ],
                                            ),
                                            trailing: Column(
                                              children: [
                                                Text("₹ 20".toUpperCase(),
                                                    style: const TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ));
                              }),
                        ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          v = !v;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 17),
                        child: Text(
                          v == true ? "SEE MORE..." : "SEE LESS...",
                          style: TextStyle(fontSize: 18),
                        ),
                      )),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => HomeP()),
                                // );
                              },
                              child: Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SameEx()),
                                      );
                                    },
                                    child: Container(
                                      // height: 50,
                                      // width: 160,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25, vertical: 15),
                                        child: Text(
                                          "Paid Expenses".toUpperCase(),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),

                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius:
                                            BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                ],
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
    );
  }
}

// child: Center(
// child: Text(
// 'Selected Segment: ${_selectedSegment.name}',
// style: const TextStyle(color: CupertinoColors.white),
// ),
// ),
