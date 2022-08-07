import 'package:community_internal/core/models/post.model.dart';
import 'package:community_internal/core/repository/post_repository.dart';
import 'package:community_internal/ui/screens/member_profile.dart';
import 'package:community_internal/ui/widgets/post_container.dart';
import 'package:community_internal/ui/widgets/user_avatar.dart';
import 'package:community_internal/widgets/loading_helper.dart';
import 'package:flutter/material.dart';

class AdsScreen extends StatefulWidget {
  final String societyId;
  final String societyName;
  const AdsScreen(
      {Key? key, required this.societyId, required this.societyName})
      : super(key: key);

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
    postsList = (await _postRepository.getPosts(widget.societyId))
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
        // drawer: const DummyDrawer(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
        body: ListView.builder(
          itemBuilder: (context, index) {
            return PostContainer(
              societyName: widget.societyName,
              post: postsList.elementAt(index),
            );
          },
          itemCount: postsList.length,
        ),
      ),
    );
  }
}
