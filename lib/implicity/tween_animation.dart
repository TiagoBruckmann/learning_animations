// imports nativos do flutter
import 'package:flutter/material.dart';

// import dos estilos
import 'package:learning_animations/styles/app_images.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({Key? key}) : super(key: key);

  @override
  _TweenAnimationState createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
  @override
  Widget build(BuildContext context) {
    return Center(

      child: TweenAnimationBuilder(
        tween: ColorTween(
          begin: Colors.white,
          end: Colors.orange
        ),
        child: Image.asset(AppImages.stars),
        builder: ( context, Color? cor, widget ) {

          return ColorFiltered(
            colorFilter: ColorFilter.mode(
              cor!,
              BlendMode.overlay,
            ),
            child: widget,
          );

        },
        duration: const Duration(
          seconds: 5,
        ),
      ),

      /*
      child: TweenAnimationBuilder(
        tween: Tween<double>(
          begin: 50,
          end: 180,
        ),
        builder: ( context, double width, widget ) {

          return Container(
            color: Colors.green,
            width: width,
            height: 60,
          );

        },
        duration: const Duration(
          seconds: 5,
        ),
      ),
      */

      /*
      child: TweenAnimationBuilder(
        tween: Tween<double>(
          begin: 0,
          end: 6.28,
        ),
        builder: ( context, double angle, widget ) {

          return Transform.rotate(
            angle: angle,
            child: Image.asset(AppImages.logo),
          );

        },
        duration: const Duration(
          seconds: 5,
        ),
      ),
      */
    );
  }
}
