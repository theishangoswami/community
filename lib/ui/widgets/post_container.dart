import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:community_internal/ui/widgets/user_avatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../data/models/post_model.dart';

class PostContainer extends StatelessWidget {
  final PostModel post;

  const PostContainer({
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    bool isDesktop = false;

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
                    _PostHeader(
                      post: post,
                    ),
                    const SizedBox(height: 8.0),
                    Text(post.caption.toUpperCase()),
                    if (post.imageUrl != null) const SizedBox(height: 10.0),
                  ],
                ),
              ),
              if (post.imageUrl != null)
                _PostPhotoContainer(
                  postImageUrl: post.imageUrl,
                ),
              _PostStats(
                post: post,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final PostModel post;

  const _PostHeader({
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserAvatar(
          radius: 35,
          imgUrl: post.user.profileImageUrl,
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} • '.toUpperCase(),
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
        // IconButton(
        //   icon: const Icon(Icons.more_horiz),
        //   onPressed: () => print('More'),
        // ),
      ],
    );
  }
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
        child: Container(
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

class _PostStats extends StatelessWidget {
  final PostModel post;

  const _PostStats({
    required this.post,
  });

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
                child: Text(
                  '${post.likes}',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Text(
                '${post.comments} Comments'.toUpperCase(),
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(width: 8.0),
              Text(
                '${post.shares} Shares'.toUpperCase(),
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
                  print('Like');
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
                  _commentBox(context);
                  print('Comment');
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

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetAnimationCurve: Curves.easeInOut,
          insetAnimationDuration: Duration(milliseconds: 200),
          child: Container(
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
                    Spacer(),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Write your comment ...',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {},
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
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
