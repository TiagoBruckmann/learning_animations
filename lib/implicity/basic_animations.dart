// imports nativos do flutter
import 'package:flutter/material.dart';

class BasicAnimations extends StatefulWidget {
  const BasicAnimations({Key? key}) : super(key: key);

  @override
  _BasicAnimationsState createState() => _BasicAnimationsState();
}

class _BasicAnimationsState extends State<BasicAnimations> {

  bool _status = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: const Text("Meu app"),
      ),

      // animacao no aviao
      /*
      body: AnimatedContainer(
        padding: const EdgeInsets.only( top: 20, bottom: 100 ),
        color: Colors.green,
        alignment: ( _status == true )
        ? Alignment.bottomCenter
        : Alignment.topCenter,
        duration: const Duration(
          seconds: 4,
        ),
        child: AnimatedOpacity(
          child: const SizedBox(
            height: 50,
            child: Icon(
              Icons.airplanemode_active,
              size: 50,
              color: Colors.white,
            ),
          ),
          duration: const Duration(
            seconds: 3,
          ),
          opacity: ( _status == true )
          ? 1
          : 0,
        ),
      ),
      */

      body: GestureDetector(
        child: AnimatedContainer(
          child: ( _status == true )
          ? const Icon(
            Icons.person_add,
            color: Colors.white,
          )
          : const Text(
            "Mensagem",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
          ),
          width: ( _status == true )
          ? 60
          : 160,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(30),
          ),
          alignment: Alignment.center,
          curve: Curves.linear,
          duration: const Duration(
            milliseconds: 500
          ),
        ),
        onTap: () {
          setState(() {
            _status = !_status;
          });
        },
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white70,
        elevation: 6,
        child: const Icon(
          Icons.add_box,
        ),
        onPressed: () {
          setState(() {
            _status = !_status;
          });
        },
      ),
    );
  }
}
