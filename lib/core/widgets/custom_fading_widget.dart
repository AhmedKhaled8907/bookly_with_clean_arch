import 'package:flutter/material.dart';

class CustomFaddingWidget extends StatefulWidget {
  const CustomFaddingWidget({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  CustomFaddingWidgetState createState() => CustomFaddingWidgetState();
}

class CustomFaddingWidgetState extends State<CustomFaddingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    animation = Tween<double>(begin: 0.2, end: 0.8).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: widget.child,
    );
  }
}
