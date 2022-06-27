import 'package:community_internal/ui/widgets/comment_box.dart';
import 'package:community_internal/ui/widgets/post_card.dart';
import 'package:flutter/material.dart';

import '../widgets/dummy_drawer.dart';
import '../widgets/user_avatar.dart';
import 'member_profile.dart';

class CommunityFeed extends StatefulWidget {
  const CommunityFeed({Key? key}) : super(key: key);

  @override
  _CommunityFeedState createState() => _CommunityFeedState();
}

class _CommunityFeedState extends State<CommunityFeed> {
  final ValueNotifier<bool> _showCommentBox = ValueNotifier(false);
  final TextEditingController _commentTextController = TextEditingController();
  final FocusNode _commentFocusNode = FocusNode();

  void openCommentBox({String? message}) {
    _commentTextController.text = message ?? '';
    _commentTextController.selection = TextSelection.fromPosition(
      TextPosition(offset: _commentTextController.text.length),
    );
    _showCommentBox.value = true;
    _commentFocusNode.requestFocus();
  }

  Future<void> addComment(String? message) async {
    if (message != null && message.isNotEmpty && message != '') {
      _commentTextController.clear();
      FocusScope.of(context).unfocus();
      _showCommentBox.value = false;
    }
  }

  @override
  void dispose() {
    _commentTextController.dispose();
    _commentFocusNode.dispose();
    super.dispose();
  }

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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          _showCommentBox.value = false;
        },
        child: Stack(
          children: [
            ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return PostCard(
                );
              },
            ),
            _CommentBox(
              textEditingController: _commentTextController,
              focusNode: _commentFocusNode,
              addComment: addComment,
              showCommentBox: _showCommentBox,
            ),
          ],
        ),
      ),
    );
  }
}

class _CommentBox extends StatefulWidget {
  const _CommentBox({
    Key? key,
    required this.textEditingController,
    required this.focusNode,
    required this.addComment,
    required this.showCommentBox,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final Function(String?) addComment;
  final ValueNotifier<bool> showCommentBox;

  @override
  __CommentBoxState createState() => __CommentBoxState();
}

class __CommentBoxState extends State<_CommentBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOut,
    reverseCurve: Curves.easeIn,
  );

  bool visibility = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          visibility = false;
        });
      } else {
        setState(() {
          visibility = true;
        });
      }
    });
    widget.showCommentBox.addListener(_showHideCommentBox);
  }

  void _showHideCommentBox() {
    if (widget.showCommentBox.value) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibility,
      child: FadeTransition(
        opacity: _animation,
        child: Builder(
          builder: (context) {
            return Align(
              alignment: Alignment.bottomCenter,
              child: CommentBox(
                textEditingController: widget.textEditingController,
                focusNode: widget.focusNode,
                onSubmitted: widget.addComment,
              ),
            );
          },
        ),
      ),
    );
  }
}
