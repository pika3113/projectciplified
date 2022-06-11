import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'dart:html';

class Activities extends StatelessWidget {
  const Activities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: (Icon(Icons.local_activity_rounded)),
        title: Text(
          'Activities',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 21.5, 4, 0),
            child: Text(
              "Sign out",
              style: TextStyle(fontSize: 12),
            ),
          ),
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(Icons.logout),
            ),
          ),
        ],
      ),
    );
  }
}
