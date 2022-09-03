import 'package:community_internal/core/services/key_storage.service.dart';
import 'package:community_internal/ui/screens/member_page/filter.dart';
import 'package:community_internal/ui/screens/member_page/search.dart';
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
    _controller = TabController(length: 3, vsync: this);
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
    final user = StorageService().getCurrentUser();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.0),
        child: AppBar(
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
                child: UserAvatar(
                  radius: 50,
                  imgUrl: user!.profile!,
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
            indicatorColor: Colors.white,
            indicatorWeight: 0.3,
            controller: _controller,
            tabs: [
              GestureDetector(
                onTap: () {
                  showFilterSheet(context);
                },
                child: Tab(
                  text: 'City'.toUpperCase(),
                  icon: const Icon(FontAwesomeIcons.locationDot),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showFilterSheet(context);
                },
                child: Tab(
                  text: 'Pin Code'.toUpperCase(),
                  icon: const Icon(FontAwesomeIcons.map),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SearchPage(),
                    ),
                  );
                },
                child: Tab(
                  text: 'Search'.toUpperCase(),
                  icon: const Icon(FontAwesomeIcons.searchengin),
                ),
              ),
            ],
          ),
        ),
      ),
      body: const MembersGridList(),
    );
  }
}
