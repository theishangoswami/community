import 'package:community_internal/core/models/post.model.dart';
import 'package:community_internal/core/repository/post_repository.dart';
import 'package:community_internal/ui/screens/member_profile.dart';
import 'package:community_internal/ui/widgets/dummy_drawer.dart';
import 'package:community_internal/ui/widgets/post_container.dart';
import 'package:community_internal/ui/widgets/user_avatar.dart';
import 'package:community_internal/widgets/loading_helper.dart';
import 'package:flutter/material.dart';

class AdsScreen extends StatefulWidget {
  const AdsScreen({Key? key}) : super(key: key);

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  final PostRepository _postRepository = PostRepository();
  List<PostModel> postsList = [];
  bool isBusy = false;
  @override
  void initState() {
    super.initState();
    fetchPostList();
  }

  Future fetchPostList() async {
    setState(() {
      isBusy = true;
    });
    postsList = (await _postRepository.getPosts())
        .where((element) => element.ads == "1")
        .toList();
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
            "Advertisements".toUpperCase(),
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
