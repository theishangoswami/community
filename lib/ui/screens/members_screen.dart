import 'package:community_internal/ui/screens/member_profile.dart';
import 'package:community_internal/ui/screens/members.list.dart';
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
    super.initState();
    _controller = TabController(length: 5, vsync: this);
    _controller?.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const DummyDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                    builder: (context) => const MemberProfileScreen(),
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
      body: const MembersGridList(),
    );
  }
}
