import 'package:flutter/material.dart';

class IntroPage2 extends StatefulWidget {
  const IntroPage2({Key? key}) : super(key: key);

  @override
  State<IntroPage2> createState() => IntroPage2State();
}

class IntroPage2State extends State<IntroPage2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: (Center(
        child: Text('p2'),
      )),
    );
  }
}
