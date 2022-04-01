// imports nativos
import 'package:flutter/material.dart';

// import dos styles
import 'package:learning_animations/styles/app_images.dart';

class AnimacaoImplicita extends StatefulWidget {
  const AnimacaoImplicita({Key? key}) : super(key: key);

  @override
  _AnimacaoImplicitaState createState() => _AnimacaoImplicitaState();
}

class _AnimacaoImplicitaState extends State<AnimacaoImplicita> {

  bool _status = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedContainer(
          padding: const EdgeInsets.all(20),
          width: _status ? 200 : 300 ,
          height: _status ? 300 : 200,
          color: _status ? Colors.white : Colors.purpleAccent,
          child: Image.asset(AppImages.logo),
          duration: const Duration(seconds: 2),
          curve: Curves.elasticInOut,
        ),
        ElevatedButton(
          child: const Text("Alterar"),
          onPressed: (){
            setState(() {
              _status = !_status;
            });
          },
        )
      ],
    );
  }
}
