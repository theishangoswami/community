import 'package:community_internal/core/models/donation.dart';
import 'package:community_internal/core/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Sky { donation, expense }

class SegmentedControlSample extends StatefulWidget {
  final List<Donation>? donationList;
  final List<Expense>? expenseList;
  const SegmentedControlSample({Key? key, this.donationList, this.expenseList})
      : super(key: key);

  @override
  State<SegmentedControlSample> createState() => _SegmentedControlSampleState();
}

class _SegmentedControlSampleState extends State<SegmentedControlSample>
    with TickerProviderStateMixin<SegmentedControlSample> {
  Sky _selectedSegment = Sky.donation;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: CupertinoSlidingSegmentedControl<Sky>(
          backgroundColor: CupertinoColors.systemGrey2,
          thumbColor: const Color(0xFFFFFFFF),
          groupValue: _selectedSegment,
          onValueChanged: (Sky? value) {
            if (value != null) {
              setState(() {
                _selectedSegment = value;
              });
            }
          },
          children: const <Sky, Widget>{
            Sky.donation: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                'Donations',
                style: TextStyle(color: CupertinoColors.black),
              ),
            ),
            Sky.expense: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                'Expenses',
                style: TextStyle(color: CupertinoColors.black),
              ),
            ),
          },
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            _selectedSegment == Sky.donation
                ? widget.donationList?.isEmpty ?? true
                    ? const Text('No transaction to show')
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        itemCount: widget.donationList!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return TransactionCard(
                            amount: "₹ ${widget.donationList![index].amount}",
                            date: DateFormat('d LLLL')
                                .format(
                                  DateTime.parse(
                                      widget.donationList![index].date),
                                )
                                .toUpperCase(),
                            personName:
                                "By ${widget.donationList![index].name} ji"
                                    .toUpperCase(),
                            title: 'Donation Received'.toUpperCase(),
                          );
                        },
                      )
                : widget.expenseList?.isEmpty ?? true
                    ? const Text('No transaction to show')
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        itemCount: widget.expenseList!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return TransactionCard(
                            amount:
                                "₹ ${widget.expenseList![index].expenseAmount}",
                            date: DateFormat('d LLLL')
                                .format(
                                  DateTime.parse(
                                      widget.expenseList![index].date),
                                )
                                .toUpperCase(),
                            personName:
                                "By ${widget.expenseList![index].vendorName} ji"
                                    .toUpperCase(),
                            title: 'Expenses Spent'.toUpperCase(),
                          );
                        },
                      ),
          ],
        ),
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  final String title;
  final String amount;
  final String date;
  final String personName;
  const TransactionCard({
    Key? key,
    required this.title,
    required this.amount,
    required this.date,
    required this.personName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        isThreeLine: true,
        subtitle: Text(
          personName + '\n' + date,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
        trailing: Text(
          amount,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
