import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserSettings extends StatelessWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: (Icon(Icons.settings_rounded)),
        centerTitle: true,
        title: Text(
          'Settings',
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
