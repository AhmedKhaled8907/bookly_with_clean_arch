import 'package:bookly_with_clean_arch/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    Key? key,
    required this.slidingAnimation,
  }) : super(key: key);

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: const Opacity(
              opacity: 0.5,
              child: Text(
                'Read Books For Free',
                style: Styles.textStyle18,
                textAlign: TextAlign.center,
              ),
            ),
          );
        });
  }
}
