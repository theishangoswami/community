import 'package:community_internal/app/locator.dart';
import 'package:community_internal/core/repository/ledger_repository.dart';
import 'package:community_internal/core/services/key_storage.service.dart';
import 'package:community_internal/main.dart';
import 'package:community_internal/ui/screens/community_list.dart';
import 'package:community_internal/ui/screens/profile.dart';
import 'package:community_internal/widgets/loading_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../widgets/dummy_drawer.dart';

List<TextEditingController> _controller = [
  for (int i = 0; i < 4; i++) TextEditingController()
];
late String select;

class OtherCom extends StatefulWidget {
  const OtherCom({Key? key}) : super(key: key);

  @override
  State<OtherCom> createState() => _OtherComState();
}

class _OtherComState extends State<OtherCom> {
  bool _isLoading = false;
  List<Icon> icons = const [
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
  List<String> datas = ["Phone number", "Address", "Amount", "Description"];

  @override
  Widget build(BuildContext context) {
    return LoadingHelper(
      isLoading: _isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Other Community"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
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
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400),
                                ),
                                TextField(
                                  controller: _controller[index],
                                  keyboardType: index == 0 || index == 2
                                      ? TextInputType.number
                                      : TextInputType.text,
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    })),
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
                    final SharedPreferences _sharedPreferences =
                        locator<SharedPreferences>();
                    final societyId = _sharedPreferences.getString('societyId');
                    final userId = StorageService().getCurrentUser();
                    await LedgerRepository().addDonation({
                      'trusty_id': userId!.id,
                      'user_name': '',
                      'user_mobile': _controller[0].text.trim(),
                      'user_email': '',
                      'address': _controller[1].text.trim(),
                      'society_id': societyId,
                      'donation_amount': _controller[2].text.trim(),
                      'status': ''
                    });
                    setState(() {
                      _isLoading = false;
                    });
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(
                            societyId: userId.societyId!, societyName: ''),
                      ),
                    );
                  },
                  child: const Text(
                    "SAVE",
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
