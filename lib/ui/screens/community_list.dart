import 'package:community_internal/main.dart';
import 'package:flutter/material.dart';

import '../widgets/dummy_drawer.dart';
import '../widgets/user_avatar.dart';
import 'member_profile.dart';

class CommunityList extends StatefulWidget {
  const CommunityList({Key? key}) : super(key: key);

  @override
  _CommunityListState createState() => _CommunityListState();
}

class _CommunityListState extends State<CommunityList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DummyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: const UserAvatar(
                radius: 60,
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
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Join your community!'.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const CommunityTile();
                  },
                  itemCount: 15,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 25,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommunityTile extends StatelessWidget {
  const CommunityTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5.0,
        bottom: 10,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        height: 75,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFE580C),
              Color(0xFFD22CD8),
            ],
          ),
          color: Color(0xFF21242B),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          // border: Border.all(
          //   color: const Color(0xFFFE580C),
          // ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.amberAccent,
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: const BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ),
            );
          },
          child: const CommunityTileCustom(),
        ),
      ),
    );
  }
}

class CommunityTileCustom extends StatelessWidget {
  const CommunityTileCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                "2500",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              Icon(
                Icons.group,
                color: Colors.grey,
              ),
            ],
          ),
          const SizedBox(
            height: 75,
            child: VerticalDivider(color: Colors.white),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Community Name".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Brahmin".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          const Icon(
            Icons.arrow_forward_sharp,
            size: 25,
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }
}
