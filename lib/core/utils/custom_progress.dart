import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';

class CustomProgress extends StatefulWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
  const CustomProgress({Key? key, required this.child, required this.onRefresh})
      : super(key: key);

  @override
  _CustomProgressState createState() => _CustomProgressState();
}

class _CustomProgressState extends State<CustomProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      child: widget.child,
      onRefresh: widget.onRefresh,
      autoRebuild: false,
      builder: (context, child, controller) => Stack(
        children: [],
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
