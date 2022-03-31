// imports nativos do flutter
import 'package:flutter/material.dart';

class FirstExplicitAnimation extends StatefulWidget {
  const FirstExplicitAnimation({Key? key}) : super(key: key);

  @override
  State<FirstExplicitAnimation> createState() => _FirstExplicitAnimationState();
}

class _FirstExplicitAnimationState extends State<FirstExplicitAnimation> with SingleTickerProviderStateMixin {

  AnimationController? _animationController;
  AnimationStatus? _animationStatus;

  _configAnimation() {

    if ( _animationStatus == AnimationStatus.dismissed ) {
      _animationController!.forward();
    } else {
      _animationController!.reverse();
    }
    /*
    if ( _animationController!.isAnimating ) {
      _animationController!.stop();
    } else {
      _animationController!.repeat();
    }
     */

  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat()..addStatusListener((status) {
      _animationStatus = status;
    });

  }

  @override
  void dispose() {
    super.dispose();
    _animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [

          SizedBox(
            width: 300,
            height: 400,
            child: RotationTransition(
              turns: _animationController!,
              alignment: Alignment.center,
              child: Image.asset(
                "assets/logo.png",
              ),
            ),
          ),

          ElevatedButton(
            onPressed: () {

              _configAnimation();
            },
            child: const Text("Pressione"),
          ),
        ],
      ),
    );
  }
}
