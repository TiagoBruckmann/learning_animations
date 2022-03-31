// imports nativos do flutter
import 'package:flutter/material.dart';

class SecondExplicitAnimation extends StatefulWidget {
  const SecondExplicitAnimation({Key? key}) : super(key: key);

  @override
  State<SecondExplicitAnimation> createState() => _SecondExplicitAnimationState();
}

class _SecondExplicitAnimationState extends State<SecondExplicitAnimation> with SingleTickerProviderStateMixin {

  AnimationController? _animationController;
  Animation? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    /*
    _animation = Tween<Offset>(
      begin: const Offset(0,0),
      end: const Offset(80,50),
    ).animate( _animationController! );
    */

    _animation = Tween<double>(
      begin: 0,
      end: 6,
    ).animate( _animationController! );

  }

  @override
  void dispose() {
    super.dispose();
    _animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {

    _animationController!.forward();

    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: AnimatedBuilder(
        animation: _animation!,
        child: Image.asset("assets/logo.png"),
        builder: ( context, widget ) {

          return Transform.rotate(
            angle: _animation!.value,
            child: widget,
          );

          /*

          return Transform.translate(
            offset: _animation!.value,
            child: widget,
          );

          return Transform.scale(
            scale: _animation!.value,
            child: widget,
          );

          return Transform.rotate(
            angle: _animation!.value,
            child: widget,
          );
          */

        },
      ),
    );
  }
}
