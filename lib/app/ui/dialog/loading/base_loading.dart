import 'package:flutter/material.dart';
import 'package:yachaq/app/utils/resources.dart';

class BaseLoadingPage extends StatefulWidget {
  @override
  _BaseLoadingPageState createState() => _BaseLoadingPageState();
}

class _BaseLoadingPageState extends State<BaseLoadingPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationImageController;

  @override
  void initState() {
    _animationImageController = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationImageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: RotationTransition(
            turns:
            Tween(begin: 0.0, end: 1.0).animate(_animationImageController),
            child: Image.asset(Resources.loader_red,
                fit: BoxFit.contain, width: 80, height: 80)));
  }
}
