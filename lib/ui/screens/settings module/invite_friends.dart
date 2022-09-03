import 'package:community_internal/core/services/key_storage.service.dart';
import 'package:community_internal/ui/screens/settings%20module/transaction_request.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                      dashPattern: [10, 6],
                      //dash patterns, 10 is dash width, 6 is space width
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 9),
                        child: Text(
                          user!.referralCode!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 50, left: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                        color: Colors.amber,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.share,
                                size: 22,
                              ),
                              const SizedBox(
                                width: 11,
                              ),
                              Text("Share".toUpperCase(),
                                  style: const TextStyle(
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
                    RaisedButton(
                        color: Colors.amber,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.copy,
                                size: 22,
                              ),
                              const SizedBox(
                                width: 11,
                              ),
                              Text("COPY CODE".toUpperCase(),
                                  style: const TextStyle(
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
                    RaisedButton(
                        color: Colors.amber,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                FontAwesomeIcons.whatsapp,
                                size: 21,
                              ),
                              const SizedBox(
                                width: 11,
                              ),
                              Text("WHATSAPP".toUpperCase(),
                                  style: const TextStyle(
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
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
