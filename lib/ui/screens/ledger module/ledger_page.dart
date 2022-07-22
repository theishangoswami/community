// import 'package:flutter/material.dart';
//
// class ledger_page extends StatefulWidget {
//   const ledger_page({Key? key}) : super(key: key);
//   @override
//   _ledger_pageState createState() => _ledger_pageState();
// }
//
// class _ledger_pageState extends State<ledger_page> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Ledger".toUpperCase(),
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.white,
//         iconTheme: const IconThemeData(
//           color: Colors.black,
//         ),
//       ),
//       body: ListView(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Card(
//                       elevation: 3,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       color: Colors.greenAccent,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 40,
//                           vertical: 20,
//                         ),
//                         child: Column(
//                           children: [
//                             Text(
//                               "₹ 10,000".toUpperCase(),
//                               style: const TextStyle(
//                                 fontSize: 23,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 5,
//                             ),
//                             Text(
//                               "To Collect".toUpperCase(),
//                               style: const TextStyle(fontSize: 14),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Card(
//                       elevation: 3,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       color: Colors.deepOrange,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 40,
//                           vertical: 20,
//                         ),
//                         child: Column(
//                           children: [
//                             Text(
//                               "₹ 30,000".toUpperCase(),
//                               style: const TextStyle(
//                                 fontSize: 23,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 5,
//                             ),
//                             Text(
//                               "To Pay".toUpperCase(),
//                               style: const TextStyle(fontSize: 14),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 13),
//                 child: Text(
//                   "ledger_page".toUpperCase(),
//                   style: const TextStyle(
//                       fontSize: 22, fontWeight: FontWeight.w500,),
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               SizedBox(
//                 height: 370,
//                 child: ListView.builder(
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: 4,
//                   itemBuilder: (BuildContext context, int index) {
//                     return GestureDetector(
//                       onTap: () {},
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         child: Card(
//                           elevation: 4,
//                           child: Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: ListTile(
//                               leading: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Text(
//                                     "Donation Received".toUpperCase(),
//                                     style: const TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                   Text(
//                                     "By Nihal ji".toUpperCase(),
//                                     style: const TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                   Text(
//                                     "12 June".toUpperCase(),
//                                     style: const TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               trailing: Column(
//                                 children: [
//                                   Text(
//                                     "₹ 300".toUpperCase(),
//                                     style: const TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Container(
//                       height: 50,
//                       width: 160,
//                       child: Center(
//                         child: Text(
//                           "Recieved Donation".toUpperCase(),
//                           style: const TextStyle(
//                             color: Colors.amber,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.black,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                     Container(
//                       height: 50,
//                       width: 160,
//                       child: Center(
//                         child: Text(
//                           "Bill Paid".toUpperCase(),
//                           style: const TextStyle(
//                             color: Colors.amber,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.black,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:community_internal/ui/screens/member_profile.dart';
import 'package:community_internal/ui/screens/ledger module/slider.dart';
import 'package:community_internal/ui/widgets/dummy_drawer.dart';
import 'package:community_internal/ui/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'slider.dart';

class ledger_page extends StatefulWidget {
  const ledger_page({Key? key}) : super(key: key);
  @override
  _ledger_pageState createState() => _ledger_pageState();
}

class _ledger_pageState extends State<ledger_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ledger".toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.greenAccent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                      child: Column(
                        children: [
                          Text("₹ 10,000".toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "To Collect".toUpperCase(),
                            style: const TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.deepOrange,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                      child: Column(
                        children: [
                          Text("₹ 30,000".toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "To Pay".toUpperCase(),
                            style: const TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 68),
                  child: Text(
                    "Transactions".toUpperCase(),
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SegmentedControlSample(),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 30,
            ),
          ]),
        ],
      ),
    );
  }
}
