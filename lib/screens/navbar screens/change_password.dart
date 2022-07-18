import 'package:flutter/material.dart';
import 'package:projectciplified/screens/navbar%20screens/manage_password.dart';
import 'package:projectciplified/screens/navbar%20screens/user_settings_page.dart';

class changePassword extends StatefulWidget {
  const changePassword({Key? key}) : super(key: key);

  @override
  State<changePassword> createState() => _changePasswordState();
}

class _changePasswordState extends State<changePassword> {
  //initially show login page
  bool showManagePage = false;

  void toggleScreens() {
    setState(() {
      showManagePage = !showManagePage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showManagePage) {
      return ManagePassword(showManagePage: toggleScreens);
    } else {
      return UserSettings(showPasswordPage: toggleScreens);
    }
  }
}
