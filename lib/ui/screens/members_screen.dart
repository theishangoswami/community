import 'package:community_internal/ui/screens/member_profile.dart';
import 'package:community_internal/ui/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/dummy_drawer.dart';

class MembersScreen extends StatefulWidget {
  const MembersScreen({Key? key}) : super(key: key);

  @override
  _MembersScreenState createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen>
    with SingleTickerProviderStateMixin {
  late TabController? _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 5, vsync: this);
    _controller?.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Members".toUpperCase(),
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
                    builder: (context) =>  MemberProfileScreen(),
                  ),
                );
              },
            ),
          )
        ],
        bottom: TabBar(
          labelColor: Colors.black,
          isScrollable: true,
          indicatorColor: Colors.white70,
          indicatorWeight: 0.3,
          controller: _controller,
          // isScrollable: true,
          // overlayColor: MaterialStateProperty.all(Colors.amberAccent),
          indicator: const BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          tabs: [
            Tab(
              text: 'Address'.toUpperCase(),
              icon: const Icon(FontAwesomeIcons.locationDot),
            ),
            Tab(
              text: 'Pin Code'.toUpperCase(),
              icon: const Icon(FontAwesomeIcons.map),
            ),
            Tab(
              text: 'Groups'.toUpperCase(),
              icon: const Icon(FontAwesomeIcons.peopleGroup),
            ),
            Tab(
              text: 'Identity'.toUpperCase(),
              icon: const Icon(FontAwesomeIcons.fingerprint),
            ),
            Tab(
              text: 'Search'.toUpperCase(),
              icon: const Icon(FontAwesomeIcons.searchengin),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
              },
              child: GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 25.0,
                  childAspectRatio: (MediaQuery.of(context).size.width) /
                      (MediaQuery.of(context).size.height / 1.4),
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Material(
                      elevation: 8.0,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      shadowColor: Colors.amber.withOpacity(0.8),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/person.jpg',
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Sunil Pandey'.toUpperCase(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    'Secretary'.toUpperCase(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  Text(
                                    'Brahman Samithi'.toUpperCase(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
