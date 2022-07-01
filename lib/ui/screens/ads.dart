import 'package:community_internal/ui/screens/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'inbox.dart';

class AdsPage extends StatefulWidget {
  const AdsPage({Key? key}) : super(key: key);

  @override
  State<AdsPage> createState() => _AdsPageState();
}

class _AdsPageState extends State<AdsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
          },
          child: const Text(
            "CHATS",
            style: TextStyle(fontSize: 25),
          ),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.search,
                    size: 29,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Search",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
          ),
          // Container(
          //   width: 355,
          //   height:80,
          //   child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: 10,
          //       itemBuilder: (context, index) {
          //         return  Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: CircleAvatar(
          //             backgroundColor: Colors.black,
          //             child: Text("S",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
          //             radius: 31,
          //
          //           ),
          //         );
          //       }),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 590,
                    child: ListView.builder(
                      // physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatBox()),
                                );
                              },
                              child: const ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  backgroundImage: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9HnW7_fXjyucPMl2rsiChfZC1M9fp5DL9QA&usqp=CAU"),
                                  radius: 25,
                                ),
                                title: Text("ISHAN",
                                    style: TextStyle(fontSize: 17)),
                                subtitle: Text("Whats up",
                                    style: TextStyle(fontSize: 16)),
                                trailing: Text("2:34 pm",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ),
                            const Divider(
                              color: Colors.black,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
