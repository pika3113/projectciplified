import 'package:flutter/material.dart';
import 'package:projectciplified/auth/auth_page.dart';

import 'package:projectciplified/auth_screens/login_page.dart';
import 'package:projectciplified/screens/intro_screens/onboarding_page.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:projectciplified/main_page.dart';
import 'package:projectciplified/screens/navbar%20screens/controlling_page.dart';
import 'package:projectciplified/screens/navbar%20screens/make_activity_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
