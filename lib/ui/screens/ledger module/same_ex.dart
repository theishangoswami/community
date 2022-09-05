import 'dart:io';

import 'package:community_internal/core/repository/ledger_repository.dart';
import 'package:community_internal/core/services/file.service.dart';
import 'package:community_internal/core/services/key_storage.service.dart';
import 'package:community_internal/ui/screens/community_list.dart';
import 'package:community_internal/ui/screens/profile.dart';
import 'package:community_internal/widgets/loading_helper.dart';
import 'package:flutter/material.dart';

// import '../widgets/dummy_drawer.dart';

List<TextEditingController> _controller = [
  for (int i = 0; i < 6; i++) TextEditingController()
];
late String select;

class SameEx extends StatefulWidget {
  const SameEx({Key? key}) : super(key: key);

  @override
  State<SameEx> createState() => _SameExState();
}

class _SameExState extends State<SameEx> {
  List<Icon> icons = const [
    Icon(
      Icons.person,
      color: Colors.black,
    ),
    Icon(
      Icons.phone_android,
      color: Colors.black,
    ),
    Icon(
      Icons.location_on_sharp,
      color: Colors.black,
    ),
    Icon(
      Icons.add,
      color: Colors.black,
    ),
    Icon(
      Icons.description,
      color: Colors.black,
    ),
  ];
  List<String> datas = [
    "Vendor Name",
    "Vendor pHONE Number",
    "Vendor Address",
    "Expense Amount",
    "Description",
  ];

  final FilePickerService _filePickerService = FilePickerService();
  File? file;
  int? type;
  bool _isLoading = false;
  LedgerRepository _ledgerRepository = LedgerRepository();

  @override
  Widget build(BuildContext context) {
    return LoadingHelper(
      isLoading: _isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Same Expenses"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: icons.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                          height: 70,
                          width: 30,
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(3)),
                          ),
                          child: icons[index]),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              datas[index].toUpperCase(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.w400),
                            ),
                            TextField(
                              controller: _controller[index],
                              keyboardType: index == 1 || index == 3
                                  ? TextInputType.number
                                  : TextInputType.text,
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            ListTile(
              onTap: () async {
                var file = await _filePickerService.pickImageFromGallery();
                setState(() {
                  this.file = file;
                  type = 2;
                });
              },
              leading: const Icon(
                Icons.photo,
                color: Colors.blue,
              ),
              title: Text("Photo".toUpperCase()),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.maxFinite, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () async {
                    setState(() {
                      _isLoading = true;
                    });
                    final user = StorageService().getCurrentUser()!;
                    print('Name--->${_controller[0].text.trim()}');
                    print('Address--->${_controller[2].text.trim()}');
                    final res = await _ledgerRepository.addExpense(
                      {
                        'trusty_id': user.id!,
                        'society_id': user.societyId!,
                        "vender_name": _controller[0].text.trim(),
                        "vender_mobile_number": _controller[1].text.trim(),
                        "vender_address": _controller[2].text.trim(),
                        "expense_amount": _controller[3].text.trim(),
                        "remark": _controller[4].text.trim(),
                      },
                      file,
                    );
                    setState(() {
                      _isLoading = false;
                    });
                    if (res) {
                      Navigator.pop(context, true);
                    }
                  },
                  child: const Text(
                    "Add Expense",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
