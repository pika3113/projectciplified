import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectciplified/screens/navbar%20screens/controlling_page.dart';
import 'package:projectciplified/screens/login_page.dart';
import 'package:projectciplified/screens/intro_screens/onboarding_page.dart';

import '../auth/auth_page.dart';

bool login = false;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ControllingPage();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
