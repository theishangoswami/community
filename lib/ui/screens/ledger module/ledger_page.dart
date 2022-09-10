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
import 'package:community_internal/app/locator.dart';
import 'package:community_internal/core/models/donation.dart';
import 'package:community_internal/core/models/expense.dart';
import 'package:community_internal/core/repository/ledger_repository.dart';
import 'package:community_internal/core/services/key_storage.service.dart';
import 'package:community_internal/ui/screens/ledger module/slider.dart';
import 'package:community_internal/ui/screens/ledger%20module/other_community.dart';
import 'package:community_internal/ui/screens/ledger%20module/same_community.dart';
import 'package:community_internal/ui/screens/ledger%20module/same_ex.dart';
import 'package:community_internal/widgets/loading_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'slider.dart';

class LedgerPage extends StatefulWidget {
  const LedgerPage({Key? key}) : super(key: key);
  @override
  _LedgerPageState createState() => _LedgerPageState();
}

class _LedgerPageState extends State<LedgerPage> {
  bool _isloading = false;
  final LedgerRepository _ledgerRepository = LedgerRepository();
  List<Donation>? donationList = [];
  List<Expense>? expenseList = [];
  String? totalDonationAmount;
  String? totalExpenseAmount;
  void fetchDonationListAndAmounts() async {
    setState(() {
      _isloading = true;
    });
    final user = StorageService().getCurrentUser();
    donationList =
        await _ledgerRepository.getDonation(user!.societyId.toString());
    expenseList = await _ledgerRepository.getExpense(user.societyId.toString());
    totalDonationAmount =
        await _ledgerRepository.getTotalDonation(user.societyId!);
    totalExpenseAmount =
        await _ledgerRepository.getTotalExpense(user.societyId!);
    print('Toatl Donation Amount: $totalDonationAmount');
    print('Toatl Expense Amount: $totalExpenseAmount');
    print('Donation List: $donationList');
    print('Expense List: $expenseList');
    setState(() {
      _isloading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchDonationListAndAmounts();
  }

  @override
  Widget build(BuildContext context) {
    final user = StorageService().getCurrentUser();
    return LoadingHelper(
      isLoading: _isloading,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: user?.userType == '1' ||
                user?.userType == '2' ||
                user?.userType == '3' ||
                user?.userType == '4'
            ? FloatingActionButton(
                onPressed: () {},
                child: SpeedDial(
                  child: const Icon(
                    Icons.add,
                    size: 30,
                  ),
                  spacing: 20,
                  elevation: 0,
                  buttonSize: const Size(70, 70),
                  backgroundColor: Colors.transparent,
                  children: [
                    SpeedDialChild(
                      child: const Icon(Icons.money),
                      label: 'ADD DONATION',
                      backgroundColor: Colors.amberAccent,
                      onTap: () async {
                        final res = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SameCom()),
                        );
                        if (res == true) {
                          fetchDonationListAndAmounts();
                        }
                      },
                    ),
                    SpeedDialChild(
                      child: const Icon(Icons.currency_rupee),
                      label: 'GUPT DONATION',
                      backgroundColor: Colors.amberAccent,
                      onTap: () async {
                        final res = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OtherCom()),
                        );
                        if (res == true) {
                          fetchDonationListAndAmounts();
                        }
                      },
                    ),
                    SpeedDialChild(
                      child: const Icon(Icons.currency_rupee),
                      label: 'ADD EXPENSE',
                      backgroundColor: Colors.amberAccent,
                      onTap: () async {
                        final res = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SameEx(),
                          ),
                        );
                        if (res == true) {
                          fetchDonationListAndAmounts();
                        }
                      },
                    ),
                  ],
                ),
              )
            : Container(),
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
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                            Text("₹ ${totalDonationAmount ?? 0}".toUpperCase(),
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
                            Text("₹ ${totalExpenseAmount ?? 0}".toUpperCase(),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Transactions".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SegmentedControlSample(
                    donationList: donationList,
                    expenseList: expenseList,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
