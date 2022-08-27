import 'package:community_internal/core/models/comment.model.dart';
import 'package:community_internal/core/models/post.model.dart';
import 'package:community_internal/core/repository/post_repository.dart';
import 'package:community_internal/widgets/loading_helper.dart';
import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  final PostModel post;
  const CommentPage({Key? key, required this.post}) : super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  bool _isLoading = false;
  final PostRepository _postRepository = PostRepository();
  List<CommentModel> commentList = [];
  final TextEditingController _commentController = TextEditingController();

  void _fetchComments() async {
    setState(() {
      _isLoading = true;
    });
    commentList = await _postRepository.fetchComment(widget.post.id!);
    print('commentList: $commentList');
    setState(() {
      _isLoading = false;
    });
  }

  void _addComment() async {
    print('Userid ${widget.post.userId}');
    print('Postid ${widget.post.id}');
    print('societyid ${widget.post.societyId}');
    final response = await _postRepository.addComment(
      CommentModel(
        userId: widget.post.userId!,
        postId: widget.post.id!,
        societyId: widget.post.societyId!,
        comment: _commentController.text.trim(),
      ),
    );
    if (response) {
      _fetchComments();
      _commentController.clear();
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchComments();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingHelper(
      isLoading: _isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Comments".toUpperCase()),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.send))],
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    // shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Image.asset("assets/images/friend.png"),
                            ),
                            title: Text(
                              commentList[index].comment ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors.black,
                          )
                        ],
                      );
                    },
                    itemCount: commentList.length,
                  ),
                ),
                const SizedBox(
                  height: 80,
                )
              ],
            ),
            Container(
              height: 80,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 19),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Image.asset("assets/images/friend.png"),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Comment'.toUpperCase()),
                    ),
                  ),
                  trailing: GestureDetector(
                      onTap: () {
                        _addComment();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Post".toUpperCase(),
                          style: const TextStyle(fontSize: 15),
                        ),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
