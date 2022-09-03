import 'package:community_internal/core/services/key_storage.service.dart';
import 'package:community_internal/main.dart';
import 'package:community_internal/ui/screens/community_list.dart';
import 'package:community_internal/widgets/loading_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VerifyPage extends StatefulWidget {
  final String phonenumber;
  const VerifyPage({Key? key, required this.phonenumber}) : super(key: key);

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  bool _isloading = false;
  @override
  Widget build(BuildContext context) {
    return LoadingHelper(
      isLoading: _isloading,
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                height: 270,
                child: Image.asset(
                  "assets/images/break.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              "Your account VERIFICATION is in progress !".toUpperCase(),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: GestureDetector(
                onTap: () async {
                  setState(() {
                    _isloading = true;
                  });
                  await StorageService().saveUser(widget.phonenumber);
                  final user = StorageService().getCurrentUser();
                  setState(() {
                    _isloading = false;
                  });
                  if (user!.status == 'enable') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            user.societyId?.isNotEmpty ?? false
                                ? MyHomePage(
                                    societyId: user.societyId!,
                                    societyName: user.societyName!,
                                  )
                                : const CommunityList(),
                      ),
                    );
                  } else {
                    Fluttertoast.showToast(
                        msg: 'Your account is not verified yet');
                  }
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(22))),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 65, vertical: 18),
                    child: Text(
                      "CHECK STATUS",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
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
