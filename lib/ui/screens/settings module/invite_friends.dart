import 'package:community_internal/core/services/key_storage.service.dart';
import 'package:community_internal/ui/screens/settings%20module/transaction_request.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = StorageService().getCurrentUser();
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25, top: 80),
          child: Column(
            children: [
              Image.asset("assets/images/friend.png"),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text("Invite your friends by sharing this code",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 3, vertical: 15),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 0), //padding of outer Container
                    child: DottedBorder(
                      color: Colors.black, //color of dotted/dash line
                      strokeWidth: 3, //thickness of dash/dots
                      dashPattern: const [10, 6],
                      //dash patterns, 10 is dash width, 6 is space width
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 9),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 88),
                              child: Text(
                                user!.referralCode!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const Icon(Icons.copy),
                            const Text(
                              "Copy Code",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 40,
                  width: 116,
                  child: RaisedButton(
                      color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.share,
                              size: 21,
                            ),
                            SizedBox(
                              width: 11,
                            ),
                            Text("Share",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 19)),
                          ],
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Request()),
                        );
                      }),
                ),
              )
            ],
          ),
        ));
  }
}
