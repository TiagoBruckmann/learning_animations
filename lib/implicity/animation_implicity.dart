// imports nativos do flutter
import 'package:flutter/material.dart';

// import dos estilos
import 'package:learning_animations/styles/app_images.dart';

class AnimationImplicity extends StatefulWidget {
  const AnimationImplicity({Key? key}) : super(key: key);

  @override
  _AnimationImplicityState createState() => _AnimationImplicityState();
}

class _AnimationImplicityState extends State<AnimationImplicity> {

  bool _status = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        AnimatedContainer(
          padding: const EdgeInsets.all(20),
          width: ( _status == true )
          ? 200
          : 300,
          height: ( _status == true )
          ? 300
          : 200,
          color: ( _status == true )
          ? Colors.white70
          : Colors.purpleAccent,
          child: Image.asset(AppImages.logo),
          duration: const Duration(
            seconds: 1
          ),
          curve: Curves.elasticOut,
        ),

        // existem diversos tipos de cusves segue o link =>
        // https://api.flutter.dev/flutter/animation/Curves-class.html
        
        ElevatedButton(
          child: const Text("Alterar"),
          onPressed: () {
            setState(() {
              _status = !_status;
            });
          },
        ),
        
      ],
    );
  }
}
