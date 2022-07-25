import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({
    Key? key,
    required this.isLiked,
    this.size = 22,
    required this.onTap,
  }) : super(key: key);

  /// Indicates if it is liked or not.
  final bool isLiked;

  /// Size of the icon.
  final double size;

  /// onTap callback. Returns a value to indicate if liked or not.
  final Function(bool val) onTap;

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  late bool isLiked = widget.isLiked;

  void _handleTap() {
    setState(() {
      isLiked = !isLiked;
    });
    widget.onTap(isLiked);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedCrossFade(
        firstCurve: Curves.easeIn,
        secondCurve: Curves.easeOut,
        firstChild: Icon(
          Icons.favorite,
          color: Colors.red,
          size: widget.size,
        ),
        secondChild: Icon(
          Icons.favorite_outline,
          size: widget.size,
        ),
        crossFadeState:
            isLiked ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 200),
      ),
    );
  }
}
