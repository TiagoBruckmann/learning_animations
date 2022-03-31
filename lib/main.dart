// imports nativos do flutter
import 'package:flutter/material.dart';

// import das telas
import 'package:learning_animations/explicit/second_explicit_animation.dart';
import 'package:learning_animations/explicit/first_explicit_animation.dart';
import 'package:learning_animations/implicity/animation_implicity.dart';
import 'package:learning_animations/implicity/basic_animations.dart';
import 'package:learning_animations/implicity/tween_animation.dart';

Future<void> main() async {

  runApp(
    const MaterialApp(
      title: "Animações",
      home: SecondExplicitAnimation(),
      debugShowCheckedModeBanner: false,
    ),
  );
}