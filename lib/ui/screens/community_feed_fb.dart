import 'package:community_internal/ui/widgets/post_container.dart';
import 'package:community_internal/widgets/loading_helper.dart';
import 'package:flutter/material.dart';

import '../../core/models/post.model.dart';
import '../../core/repository/post_repository.dart';
import '../widgets/dummy_drawer.dart';
import '../widgets/user_avatar.dart';
import 'member_profile.dart';

class CommunityFeedFb extends StatefulWidget {
  const CommunityFeedFb({Key? key}) : super(key: key);

  @override
  _CommunityFeedFbState createState() => _CommunityFeedFbState();
}

class _CommunityFeedFbState extends State<CommunityFeedFb> {
  final PostRepository _postRepository = PostRepository();
  List<PostModel> postsList = [];
  bool isBusy = false;
  @override
  void initState() {
    super.initState();
    fetchPostList();
  }

  fetchPostList() async {
    setState(() {
      isBusy = true;
    });
    postsList = await _postRepository.getPosts();
    setState(() {
      isBusy = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoadingHelper(
      isLoading: isBusy,
      child: Scaffold(
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
            return PostContainer(
              post: postsList.elementAt(index),
            );
          },
          separatorBuilder: (ctx, i) => Container(),
          itemCount: postsList.length,
        ),
      ),
    );
  }
}
