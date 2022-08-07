import 'package:community_internal/core/repository/post_repository.dart';
import 'package:community_internal/ui/widgets/like_button.dart';
import 'package:community_internal/ui/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _ProfileSlab(),
        _PictureCarousal(),
        _Description(),
        _InteractiveCommentSlab(),
      ],
    );
  }
}

class _PictureCarousal extends StatefulWidget {
  const _PictureCarousal({
    Key? key,
  }) : super(key: key);

  @override
  __PictureCarousalState createState() => __PictureCarousalState();
}

class __PictureCarousalState extends State<_PictureCarousal> {
  PostRepository _postRepository = PostRepository();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ..._pictureCarousel(context),
        _likes(),
      ],
    );
  }

  /// Picture carousal and interaction buttons.
  List<Widget> _pictureCarousel(BuildContext context) {
    const iconPadding = EdgeInsets.symmetric(horizontal: 8, vertical: 4);
    var imageUrl =
        'https://images.unsplash.com/photo-1532635241-17e820acc59f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=815&q=80';
    double aspectRatio = 4 / 3;
    final iconColor = Theme.of(context).iconTheme.color!;
    return [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 500),
            child: AspectRatio(
              aspectRatio: aspectRatio,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      Row(
        children: [
          const SizedBox(
            width: 4,
          ),
          Padding(
            padding: iconPadding,
            child: LikeButton(
              isLiked: true,
              onTap: (liked) {
                // _postRepository.addLike();
              },
            ),
          ),
          Padding(
            padding: iconPadding,
            child: Icon(
              Icons.chat_bubble_outline,
              color: iconColor,
            ),
          ),
          Padding(
            padding: iconPadding,
            child: Icon(
              Icons.call_made,
              color: iconColor,
            ),
          ),
          const Spacer(),
          Padding(
            padding: iconPadding,
            child: Icon(
              Icons.bookmark_border,
              color: iconColor,
            ),
          ),
        ],
      )
    ];
  }

  Widget _likes() {
    return const Padding(
      padding: EdgeInsets.only(left: 16.0, top: 8),
      child: Text.rich(
        TextSpan(
          text: 'Liked by ',
          style: TextStyle(
            color: Colors.black87,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'Praveen Varma',
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
      child: Text.rich(
        TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'Sunil Pandey',
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            TextSpan(text: ' '),
            TextSpan(
              text: 'I am going to Delhi, this weekend!',
            ),
          ],
        ),
      ),
    );
  }
}

class _InteractiveCommentSlab extends StatefulWidget {
  const _InteractiveCommentSlab({
    Key? key,
  }) : super(key: key);

  @override
  _InteractiveCommentSlabState createState() => _InteractiveCommentSlabState();
}

class _InteractiveCommentSlabState extends State<_InteractiveCommentSlab> {
  int get _commentCount => 10;

  @override
  Widget build(BuildContext context) {
    const textPadding = EdgeInsets.all(8);
    const spacePadding = EdgeInsets.only(left: 20.0, top: 8);
    final commentCount = _commentCount;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (commentCount > 0)
          const Padding(
            padding: spacePadding,
            child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Anil Sharma',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(text: '  '),
                  TextSpan(
                    text: 'Wow, thats amazing :)',
                  ),
                ],
              ),
            ),
          ),
        if (commentCount > 1)
          const Padding(
            padding: spacePadding,
            child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Rahul Shetty',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(text: '  '),
                  TextSpan(
                    text: 'Have a nice trip, buddy!',
                  ),
                ],
              ),
            ),
          ),
        if (commentCount > 2)
          Padding(
            padding: spacePadding,
            child: GestureDetector(
              onTap: () {
                // TODO
              },
              child: Text(
                'View all $commentCount comments',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 3, right: 8),
            child: Row(
              children: [
                const _ProfilePicture(),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Add a comment',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Padding(
                    padding: textPadding,
                    child: Text('❤️'),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Padding(
                    padding: textPadding,
                    child: Text('🙌'),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16.0, top: 4),
          child: Text(
            '2d ago',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}

class _ProfilePicture extends StatelessWidget {
  const _ProfilePicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const UserAvatar(radius: 20);
  }
}

class _ProfileSlab extends StatelessWidget {
  const _ProfileSlab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
      child: Row(
        children: [
          const UserAvatar(radius: 25),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Sunil Pandey',
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Spacer(),
          Icon(
            Icons.more_horiz,
            color: Theme.of(context).iconTheme.color!,
          ),
        ],
      ),
    );
  }
}
