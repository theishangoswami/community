import 'package:flutter/material.dart';

/// Displays a text field styled to easily add comments to posts.
///
/// Quickly add emoji reactions.
class CommentBox extends StatelessWidget {
  /// Creates a [CommentBox].
  const CommentBox({
    Key? key,
    required this.textEditingController,
    required this.focusNode,
    required this.onSubmitted,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final Function(String?) onSubmitted;

  @override
  Widget build(BuildContext context) {
    final border = _border(context);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _emojiText('❤️'),
                _emojiText('🙌'),
                _emojiText('🔥'),
                _emojiText('👏🏻'),
                _emojiText('😢'),
                _emojiText('😍'),
                _emojiText('😮'),
                _emojiText('😂'),
              ],
            ),
          ),
          Row(
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Avatar.medium(streamagramUser: commenter),
              // ),
              Expanded(
                child: TextField(
                  controller: textEditingController,
                  focusNode: focusNode,
                  onSubmitted: onSubmitted,
                  minLines: 1,
                  maxLines: 10,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    suffix: _DoneButton(
                      textEditorFocusNode: focusNode,
                      textEditingController: textEditingController,
                      onSubmitted: onSubmitted,
                    ),
                    hintText: 'Add a comment...',
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    focusedBorder: border,
                    border: border,
                    enabledBorder: border,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _border(BuildContext context) {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(24)),
      borderSide: BorderSide(
        color: Colors.grey,
        width: 0.5,
      ),
    );
  }

  Widget _emojiText(String emoji) {
    return GestureDetector(
      onTap: () {
        focusNode.requestFocus();
        textEditingController.text = textEditingController.text + emoji;
        textEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: textEditingController.text.length),
        );
      },
      child: Text(
        emoji,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}

class _DoneButton extends StatefulWidget {
  const _DoneButton({
    Key? key,
    required this.onSubmitted,
    required this.textEditorFocusNode,
    required this.textEditingController,
  }) : super(key: key);

  final Function(String?) onSubmitted;
  final FocusNode textEditorFocusNode;
  final TextEditingController textEditingController;

  @override
  State<_DoneButton> createState() => _DoneButtonState();
}

class _DoneButtonState extends State<_DoneButton> {
  final fadedTextStyle = const TextStyle(color: Colors.grey);
  late TextStyle textStyle = fadedTextStyle;

  @override
  void initState() {
    super.initState();
    widget.textEditingController.addListener(() {
      if (widget.textEditingController.text.isNotEmpty) {
        textStyle = const TextStyle(color: Colors.grey);
      } else {
        textStyle = fadedTextStyle;
      }
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.textEditorFocusNode.hasFocus
        ? GestureDetector(
            onTap: () {
              widget.onSubmitted(widget.textEditingController.text);
            },
            child: Text(
              'Done',
              style: textStyle,
            ),
          )
        : const SizedBox.shrink();
  }
}
