//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'controlling_page.dart';

class RegisterActivities extends StatefulWidget {
  const RegisterActivities({Key? key}) : super(key: key);

  @override
  State<RegisterActivities> createState() => _RegisterActivitiesState();
}

class _RegisterActivitiesState extends State<RegisterActivities> {
  late String valueChoose;
  final activities = [
    'OT requirement for Project United! [test]',
    'Project Buccaneers wants you!  [test]',
    'Project Koalas [test]',
    'Project Toothbrush  [test]'
  ];
  String? wee;
  final _nameController = TextEditingController();
  final _classController = TextEditingController();
  var selectedAct, selectedActivity;
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  final user = FirebaseAuth.instance.currentUser!;

  Future submit() async {
    await FirebaseAuth.instance;
    addStuff(_nameController.text.trim(), _classController.text.trim(),
        wee.toString().trim()

        //_nameController.text.trim(), _classController.text.trim(),
        //wee.toString().trim()
        );
  }

  //addding activity
  Future addStuff(String name, String clas, String activity) async {
    await FirebaseFirestore.instance
        .collection(wee.toString().trim())
        .doc(
          _nameController.text.trim(),
          //_nameController.text.trim(),
        )
        .set({
      'name': name,
      'class': clas,
      'activity': activity,
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _classController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        leading: (Icon(Icons.add_box_rounded)),
        centerTitle: true,
        title: Text(
          'Register for activites',
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
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Icon(Icons.app_registration_rounded),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Register your interest in a cip activity here!',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w600),
                ),
                //activity dropdown
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField<String>(
                        validator: (value) {
                          if (true) {
                            return null;
                          }
                        },
                        hint: Text("Pick an activity"),
                        value: wee,
                        isExpanded: true,
                        iconSize: 36,
                        icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                        items: activities.map(buildMenuItem).toList(),
                        onChanged: (wee) => setState(() => this.wee = wee),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        bottom: 5,
                      ),
                      child: TextFormField(
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w600),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        validator: (value) {
                          if (value!.isNotEmpty && value.length < 31) {
                            return null;
                          } else if (value.length > 30) {
                            return 'Name too long';
                          } else if (value.isEmpty) {
                            return 'Enter name';
                          } else {
                            return null;
                          }
                        },
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: InputBorder.none,
                          hintText: 'Your name',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //class
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        bottom: 5,
                      ),
                      child: TextFormField(
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w600),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        validator: (value) {
                          if (value!.isNotEmpty && value.length < 4) {
                            return null;
                          } else if (value.length > 3) {
                            return 'Class too long';
                          } else if (value.isEmpty) {
                            return 'Enter class';
                          } else {
                            return null;
                          }
                        },
                        controller: _classController,
                        decoration: InputDecoration(
                          labelText: 'Class',
                          border: InputBorder.none,
                          hintText: 'Your class',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),

//submit
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      if (!_formkey.currentState!.validate()) {
                        return null;
                      }
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Sent"),
                        ),
                      );
                      submit();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ControllingPage(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(
                        20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
      ));
}
