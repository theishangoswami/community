import 'package:flutter/material.dart';

class LoadingHelper extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final String? content;
  const LoadingHelper({
    Key? key,
    required this.child,
    required this.isLoading,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IgnorePointer(ignoring: isLoading, child: child),
        if (isLoading)
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: double.infinity,
            width: double.infinity,
            decoration:
                isLoading ? const BoxDecoration(color: Colors.black54) : null,
          ),
        if (isLoading)
          Align(
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              content: Row(
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    content ?? 'Please wait....',
                    style: const TextStyle(),
                  )
                ],
              ),
            ),
          )
      ],
    );
  }
}
