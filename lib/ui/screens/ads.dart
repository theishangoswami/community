import 'package:flutter/material.dart';

import '../widgets/dummy_drawer.dart';
import '../widgets/user_avatar.dart';
import 'member_profile.dart';

class AdsPage extends StatefulWidget {
  const AdsPage({Key? key}) : super(key: key);

  @override
  _AdsPageState createState() => _AdsPageState();
}

class _AdsPageState extends State<AdsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DummyDrawer(),
      appBar: AppBar(
        title: Text(
          "Home".toUpperCase(),
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
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Stack(
            children: [
              //  PostContainer(
              //     post: PostModel(
              // user: UserModel(
              //   name: 'Sunil Pandey',
              //   profileImageUrl:
              //   'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
              // ),
              // caption:
              // 'This is an amazing caption! Just wanted to share with the world!',
              // timeAgo: '2d ago',
              // likes: 54,
              // comments: 20,
              // shares: 14,
              // imageUrl: [
              //   'https://images.unsplash.com/photo-1577702312572-5bb9328a9f15?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
              // ],
              //   ),
              // ),

              Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 9,
                        horizontal: 6,
                      ),
                      child: Card(
                        elevation: 5,
                        child: Container(
                          height: 24,
                          width: 70,
                          color:Color(0xFF5A3FCE),
                          child: const Center(
                            child: Text(
                              "Posted as Ad",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
        separatorBuilder: (ctx, i) => Container(),
        itemCount: 1,
      ),
    );
  }
}
