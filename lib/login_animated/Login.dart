// imports nativos
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:learning_animations/login_animated/button_animated.dart';
import 'dart:ui';

// import das telas
import 'package:learning_animations/login_animated/widgets/custom_input.dart';

// styles
import 'package:learning_animations/styles/app_images.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {

  AnimationController? _animationController;
  Animation<double>? _animationBlur;
  Animation<double>? _animationFade;
  Animation<double>? _animationSize;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration( seconds: 2 ),
    );

    _animationBlur = Tween<double>(
      begin: 5,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.ease,
      ),
    );

    _animationFade = Tween<double>(
      begin: 0,
      end: 3,
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.easeInOutQuint,
      ),
    );

    _animationSize = Tween<double>(
      begin: 0,
      end: 500,
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.decelerate,
      ),
    );

    _animationController!.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // timeDilation = 10;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [

              AnimatedBuilder(
                animation: _animationBlur!,
                builder: ( context, widget ) {

                  return Container(
                    height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.background),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: _animationBlur!.value,
                        sigmaY: _animationBlur!.value,
                      ),
                      child: Stack(
                        children: <Widget>[

                          Positioned(
                            left: 10,
                            child: FadeTransition(
                              opacity: _animationFade!,
                              child: Image.asset(AppImages.det1),
                            )
                          ),
                          Positioned(
                            left: 50,
                            child: FadeTransition(
                              opacity: _animationFade!,
                              child: Image.asset(AppImages.det2),
                            ),
                          ),

                        ],
                      ),
                    ),
                  );

                },
              ),

              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [

                    AnimatedBuilder(
                      animation: _animationSize!,
                      builder: ( context, widget ) {

                        return Container(
                          width: _animationSize!.value,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[200]!,
                                blurRadius: 15,
                                spreadRadius: 4,
                              ),
                            ],
                          ),
                          child: Column(
                            children: const [

                              CustomInput(
                                hint: "Email",
                                obscure: false,
                                icon: Icon(Icons.person),
                              ),

                              CustomInput(
                                hint: "Senha",
                                obscure: true,
                                icon: Icon(Icons.lock),
                              ),

                            ],
                          ),
                        );

                      },
                    ),

                    const SizedBox(height: 20),

                    // botao
                    ButtonAnimated(
                      controller: _animationController!,
                    ),

                    const SizedBox(height: 10),

                    FadeTransition(
                      opacity: _animationFade!,
                      child: const Text(
                        "Esqueci minha senha!",
                        style: TextStyle(
                          color: Color.fromRGBO(255, 100, 127, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
