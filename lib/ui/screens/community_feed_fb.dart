import 'package:community_internal/ui/widgets/post_container.dart';
import 'package:flutter/material.dart';

import '../../data/models/post_model.dart';
import '../../data/models/user_model.dart';
import '../widgets/dummy_drawer.dart';
import '../widgets/user_avatar.dart';
import 'member_profile.dart';

class CommunityFeedFb extends StatefulWidget {
  const CommunityFeedFb({Key? key}) : super(key: key);

  @override
  _CommunityFeedFbState createState() => _CommunityFeedFbState();
}

class _CommunityFeedFbState extends State<CommunityFeedFb> {
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
          return const PostContainer(
            post: PostModel(
              user: UserModel(
                name: 'Sunil Pandey',
                profileImageUrl:
                    'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
              ),
              caption:
                  'This is an amazing caption! Just wanted to share with the world!',
              timeAgo: '2d ago',
              likes: 54,
              comments: 20,
              shares: 14,
              imageUrl: [
                'https://images.unsplash.com/photo-1577702312572-5bb9328a9f15?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
              ],
            ),
          );
        },
        separatorBuilder: (ctx, i) => Container(),
        itemCount: 8,
      ),
    );
  }
}
