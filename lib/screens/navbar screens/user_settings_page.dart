import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserSettings extends StatefulWidget {
  final VoidCallback showPasswordPage;
  const UserSettings({Key? key, required this.showPasswordPage})
      : super(key: key);

  @override
  State<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: (Icon(Icons.settings_rounded)),
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(
              fontSize: 16,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 21.5, 4, 0),
            child: Text(
              "Sign out",
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w600),
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
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: widget.showPasswordPage,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Change password",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Your activities",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
                Text('tileviews go here')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
