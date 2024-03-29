import 'package:community_internal/ui/widgets/post_container.dart';
import 'package:community_internal/widgets/loading_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/models/post.model.dart';
import '../../core/repository/post_repository.dart';
import '../widgets/dummy_drawer.dart';
import '../widgets/user_avatar.dart';
import 'member_profile.dart';

class CommunityFeedFb extends StatefulWidget {
  final String societyId;
  final String societyName;
  const CommunityFeedFb(
      {Key? key, required this.societyId, required this.societyName})
      : super(key: key);

  @override
  _CommunityFeedFbState createState() => _CommunityFeedFbState();
}

class _CommunityFeedFbState extends State<CommunityFeedFb> {
  final PostRepository _postRepository = PostRepository();
  List<PostModel> postsList = [];
  bool isBusy = false;

  Future<void> fetchPostList() async {
    setState(() {
      isBusy = true;
    });
    postsList = (await _postRepository.getPosts(widget.societyId))
        .where((element) => element.ads != "1")
        .toList();
    if (mounted) {
      setState(() {
        isBusy = false;
      });
    }
  }

  int sharedValue = 0;
  final Map<int, Widget> slidingwidgets = const <int, Widget>{
    0: Text(
      "All",
      style: TextStyle(fontSize: 16),
    ),
    1: Text(
      "President",
      style: TextStyle(fontSize: 16),
    ),
  };
  @override
  void initState() {
    super.initState();
    fetchPostList();
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                width: double.infinity,
                child: CupertinoSlidingSegmentedControl<int>(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 7.0, vertical: 7.0),
                  backgroundColor: Color.fromARGB(255, 226, 226, 226),
                  groupValue: sharedValue,
                  children: slidingwidgets,
                  onValueChanged: (int? val) {
                    setState(() {
                      sharedValue = val!;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return PostContainer(
                    post: postsList.elementAt(index),
                    societyName: widget.societyName,
                  );
                },
                itemCount: postsList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
