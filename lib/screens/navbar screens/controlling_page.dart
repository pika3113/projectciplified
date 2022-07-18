// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:projectciplified/screens/navbar%20screens/activites_page.dart';
import 'package:projectciplified/screens/navbar%20screens/change_password.dart';
import 'package:projectciplified/screens/navbar%20screens/make_activity_page.dart';
import 'package:projectciplified/screens/navbar%20screens/register_activities.dart';
import 'package:projectciplified/screens/navbar%20screens/user_settings_page.dart';

class ControllingPage extends StatefulWidget {
  const ControllingPage({Key? key}) : super(key: key);

  @override
  State<ControllingPage> createState() => _ControllingPageState();
}

class _ControllingPageState extends State<ControllingPage> {
  int _selectedIndex = 0;

  //document ids

  // method to get document ids

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    Activities(),
    HomePage(),
    RegisterActivities(),
    changePassword(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.local_activity),
              label: 'Activities',
              tooltip: 'Activities'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_rounded),
              label: 'New Activity',
              tooltip: 'New Activity'),
          BottomNavigationBarItem(
              icon: Icon(Icons.app_registration_rounded),
              label: 'Register acty',
              tooltip: 'Register for activities'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Management',
              tooltip: 'Management'),
        ],
        unselectedLabelStyle: TextStyle(
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.w600,
            color: Colors.grey),
        selectedLabelStyle: TextStyle(
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.w600,
            color: Colors.white),
      ),
    );
  }
}
