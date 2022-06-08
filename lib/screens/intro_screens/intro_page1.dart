import 'package:flutter/material.dart';

class IntroPage1 extends StatefulWidget {
  const IntroPage1({Key? key}) : super(key: key);

  @override
  State<IntroPage1> createState() => IntroPage1State();
}

class IntroPage1State extends State<IntroPage1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: (Center(
        child: Text('p1'),
      )),
    );
  }
}
