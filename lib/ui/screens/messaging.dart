import 'package:community_internal/ui/screens/inbox.dart';
import 'package:flutter/material.dart';

class Messaging extends StatefulWidget {
  @override
  _MessagingState createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Messaging",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.more_vert),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 740,
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
                              builder: (context) => ChatBox(),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9HnW7_fXjyucPMl2rsiChfZC1M9fp5DL9QA&usqp=CAU",
                            ),
                            radius: 25,
                          ),
                          title: const Padding(
                            padding: EdgeInsets.all(3),
                            child: Text(
                              "ISHAN",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(3),
                                child: Text(
                                  "Whats up",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(3.6),
                                child: Text(
                                  "2:34 pm",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                            ],
                          ),
                          trailing: const Text(
                            "Read ✔ ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
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
    );
  }
}
