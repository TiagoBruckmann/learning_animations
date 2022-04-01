// imports nativos
import 'package:flutter/material.dart';

class ButtonAnimated extends StatelessWidget {

  AnimationController controller;
  Animation<double> width;
  Animation<double> height;
  Animation<double> opacity;
  Animation<double> radius;
  ButtonAnimated({ Key? key, required this.controller })
  : width = Tween<double>(
    begin: 0,
    end: 500,
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: const Interval(
        0.5,
        1,
      ),
    ),
  ),

  height = Tween<double>(
    begin: 0,
    end: 50,
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: const Interval(
        0.5,
        0.7,
      ),
    ),
  ),

  opacity = Tween<double>(
    begin: 0,
    end: 3,
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: const Interval(
        0.6,
        0.8,
      ),
    ),
  ),

  radius = Tween<double>(
    begin: 0,
    end: 20,
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: const Interval(
        0.6,
        1,
      ),
    ),
  ),

  super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: ( context, widget ) {

        return InkWell(
          onTap: (){

          },
          child: Container(
            width: width.value,
            height: height.value,
            child: Center(
              child: FadeTransition(
                opacity: opacity,
                child: const Text(
                  "Entrar",
                  style: TextStyle(
                    color: Colors.white, fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius.value),
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(255, 100, 127, 1),
                  Color.fromRGBO(255, 123, 145, 1),
                ],
              ),
            ),
          ),
        );

      },
    );
  }
}
