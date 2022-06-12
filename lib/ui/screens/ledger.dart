import 'package:community_internal/ui/screens/member_profile.dart';
import 'package:community_internal/ui/widgets/dummy_drawer.dart';
import 'package:community_internal/ui/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

class Ledger extends StatefulWidget {
  const Ledger({Key? key}) : super(key: key);

  @override
  _LedgerState createState() => _LedgerState();
}

class _LedgerState extends State<Ledger> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DummyDrawer(),
      appBar: AppBar(
        title: Text(
          "Job Openings".toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: const UserAvatar(
                radius: 50,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MemberProfileScreen(),
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: GestureDetector(
                onTap: () {},
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                    child: Row(
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                            ),
                            child: Image.network(
                              "https://bigstep.com/assets/images/blog/webservers.jpg",
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                "Accountant | Krishna Text",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                "Jammu West, Near Delhi",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text("Rs 10,000 -Rs 12,000",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(height: 10),
                          ],
                        )
                      ],
                    )),
              ),
            );
          }),
    );
  }
}
