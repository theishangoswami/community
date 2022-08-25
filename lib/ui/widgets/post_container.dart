// ignore_for_file: unnecessary_string_interpolations

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:community_internal/app/constants.dart';
import 'package:community_internal/core/models/comment.model.dart';
import 'package:community_internal/core/models/like.model.dart';
import 'package:community_internal/core/models/user_model.dart';
import 'package:community_internal/core/repository/post_repository.dart';
import 'package:community_internal/core/utils/date.utils.dart';
import 'package:community_internal/ui/widgets/user_avatar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:community_internal/core/models/post.model.dart';
import 'package:uuid/uuid.dart';
import '../../core/repository/users.repository.dart';
import '../screens/settings module/comment_ui.dart';

class PostContainer extends StatefulWidget {
  final PostModel post;
  final String societyName;

  const PostContainer({Key? key, required this.post, required this.societyName})
      : super(key: key);

  @override
  State<PostContainer> createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer>
    with AutomaticKeepAliveClientMixin {
  UserModel? userModel;
  bool isUserDetailsfetching = false;
  @override
  void initState() {
    super.initState();
    fetchUserDetails();
  }

  fetchUserDetails() async {
    setState(() {
      isUserDetailsfetching = true;
    });
    userModel = await UserRepository().getUser(widget.post.userId!);
    print(userModel);
    setState(() {
      isUserDetailsfetching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(userModel);
    // print('User Profile - ${userModel?.profile ?? ''}');
    // print('User Name - ${userModel?.userName ?? ''}');
    super.build(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 5.0),
                    userModel == null
                        ? isUserDetailsfetching
                            ? SizedBox(
                                height: 10,
                                width: MediaQuery.of(context).size.width,
                                child: const LinearProgressIndicator(),
                              )
                            : SizedBox(
                                child: Text(
                                  "Posted " +
                                      (DateTimeUtils.convertToAgo(
                                        widget.post.date!,
                                      )),
                                ),
                              )
                        : Row(
                            children: [
                              UserAvatar(
                                radius: 35,
                                imgUrl: userModel?.profile ?? "",
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userModel?.userName ?? "",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${widget.societyName} • '
                                              .toUpperCase(),
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        Icon(
                                          Icons.public,
                                          color: Colors.grey[600],
                                          size: 12.0,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                    const SizedBox(height: 10.0),
                    Text("${widget.post.postDescription}"),
                    const SizedBox(height: 10.0),
                    if (widget.post.postLink != null)
                      const SizedBox(height: 10.0),
                  ],
                ),
              ),
              if (widget.post.postLink != null)
                widget.post.typeOfPost == "4"
                    ? Text("${widget.post.typeOfPost}")
                    : widget.post.typeOfPost == "3"
                        ? Text("Video:${widget.post.postImage}")
                        : widget.post.postLink.toString().isEmpty
                            ? const SizedBox()
                            : _PostPhotoContainer(
                                postImageUrl: [
                                  Constants.imageBaseUrl +
                                      (widget.post.postImage ?? "")
                                ],
                              ),
              _PostStats(
                post: widget.post,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _PostPhotoContainer extends StatelessWidget {
  final List<String>? postImageUrl;

  const _PostPhotoContainer({
    required this.postImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    if (postImageUrl!.length == 1) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          child: CachedNetworkImage(
            fit: BoxFit.fitWidth,
            imageUrl: postImageUrl![0],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: CarouselSlider.builder(
          itemCount: postImageUrl!.length,
          options: CarouselOptions(
            enlargeCenterPage: true,
            autoPlay: true,
          ),
          itemBuilder: (context, index, realIndex) {
            return CachedNetworkImage(
              imageUrl: postImageUrl![index],
              fit: BoxFit.cover,
              width: double.infinity,
            );
          },
        ),
      ),
    );
  }
}

class _PostStats extends StatefulWidget {
  final PostModel post;

  const _PostStats({
    required this.post,
  });

  @override
  State<_PostStats> createState() => _PostStatsState();
}

class _PostStatsState extends State<_PostStats> {
  final PostRepository _postRepository = PostRepository();
  List<LikeModel> likes = [];
  bool isLikesFetched = false;
  List<CommentModel> comments = [];
  bool isCommentsFetched = false;
  int shares = 0;
  bool isSharesFetched = false;

  @override
  void initState() {
    super.initState();
    _fetchLikes();
    _fetchComments();
  }

  void _fetchLikes() async {
    likes = await _postRepository.fetchLikes(widget.post.id!);
    if (mounted) {
      setState(() {
        isLikesFetched = true;
      });
    }
  }

  void _fetchComments() async {
    comments = await _postRepository.fetchComments(widget.post.id!);
    setState(() {
      isCommentsFetched = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          const SizedBox(height: 6.0),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                  color: Colors.lightBlue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.thumb_up_alt,
                  size: 10.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 4.0),
              Expanded(
                child: isLikesFetched
                    ? Text(
                        '${likes.length} likes',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      )
                    : const Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          child: CircularProgressIndicator(),
                          width: 10,
                          height: 10,
                        ),
                      ),
              ),
              isCommentsFetched
                  ? Text(
                      '${comments.length} Comments'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    )
                  : const Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        child: CircularProgressIndicator(),
                        width: 10,
                        height: 10,
                      ),
                    ),
              const SizedBox(width: 8.0),
              Text(
                '${1} Shares'.toUpperCase(),
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              )
            ],
          ),
          const Divider(),
          Row(
            children: [
              _PostButton(
                icon: const Icon(
                  FontAwesomeIcons.thumbsUp,
                  color: Colors.yellow,
                  size: 20.0,
                ),
                label: 'Like'.toUpperCase(),
                lableColor: Colors.black87,
                onTap: () {
// Add Like ->
                  _postRepository.addLike(
                    LikeModel(
                      id: const Uuid().v1(),
                      postId: widget.post.id!,
                      soceityId: widget.post.societyId!,
                      userId: widget.post.userId!,
                    ),
                  );
                },
              ),
              _PostButton(
                icon: Icon(
                  FontAwesomeIcons.comment,
                  color: Colors.grey[600],
                  size: 20.0,
                ),
                label: 'Comment'.toUpperCase(),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CommentPage()),
                  );
                  // _commentBox(context);
                  // if (kDebugMode) {
                  //   print('Comment');
                  // }
                },
              ),
              _PostButton(
                icon: Icon(
                  FontAwesomeIcons.share,
                  color: Colors.grey[600],
                  size: 25.0,
                ),
                label: 'Share'.toUpperCase(),
                onTap: () => print('Share'),
              )
            ],
          )
        ],
      ),
    );
  }

  void _commentBox(BuildContext context) {
    bool notDesktop = true;
    TextEditingController _controller = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetAnimationCurve: Curves.easeInOut,
          insetAnimationDuration: const Duration(milliseconds: 200),
          child: SizedBox(
            height: notDesktop
                ? MediaQuery.of(context).size.height * 0.12
                : MediaQuery.of(context).size.height * 0.45,
            width: notDesktop
                ? MediaQuery.of(context).size.width * 0.98
                : MediaQuery.of(context).size.width * 0.45,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const Spacer(),
                  TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Write your comment ...',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
// Add Comment ->
                          _postRepository.addComment(
                            CommentModel(
                              id: const Uuid().v1(),
                              comment: _controller.text,
                              postId: widget.post.id!,
                              userId: widget.post.userId!,
                              societyId: widget.post.societyId!,
                            ),
                          );
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;
  final Color lableColor;

  const _PostButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.lableColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap as void Function()?,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4.0),
                Text(
                  label,
                  style: TextStyle(color: lableColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
