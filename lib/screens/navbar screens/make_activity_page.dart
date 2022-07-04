//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectciplified/screens/main_page.dart';
import 'package:projectciplified/screens/navbar%20screens/controlling_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  //text controller
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _nameController = TextEditingController();
  final _numController = TextEditingController();

  Future submit() async {
    await FirebaseAuth.instance;
    addCIPDetails(
      _titleController.text.trim(),
      _descController.text.trim(),
      user.email.toString().trim(),
      _nameController.text.trim(),
      _numController.text.trim(),
    );
  }

//addding activity
  Future addCIPDetails(String title, String desc, String email, String name,
      String number) async {
    await FirebaseFirestore.instance
        .collection('activities')
        .doc(
          _titleController.text.trim(),
        )
        .set({
      'title': title,
      'description': desc,
      'email': email,
      'name': name,
      'number': number,
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        leading: (Icon(Icons.add_box_rounded)),
        centerTitle: true,
        title: Text(
          user.email.toString(),
          //user.email!,
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //icon
                  SizedBox(
                    height: 20,
                  ),
                  Icon(
                    Icons.group_rounded,
                    size: 100,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Make a CIP activity for others to participate in!',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //title
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
                          bottom: 2,
                          left: 20.0,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          validator: (value) {
                            if (value!.isNotEmpty && value.length < 21) {
                              return null;
                            }
                            if (value.length > 50) {
                              return 'Title too long';
                            } else if (value.isEmpty) {
                              return 'Enter title';
                            } else {
                              return null;
                            }
                          },
                          controller: _titleController,
                          decoration: InputDecoration(
                            labelText: 'Title',
                            border: InputBorder.none,
                            hintText: 'The main tittle of your activity',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //desc
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
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          validator: (value) {
                            if (value!.isNotEmpty && value.length < 1001) {
                              return null;
                            } else if (value.length > 1000) {
                              return 'Description too long';
                            } else if (value.isEmpty) {
                              return 'Enter description';
                            } else {
                              return null;
                            }
                          },
                          controller: _descController,
                          decoration: InputDecoration(
                            labelText: 'Description',
                            border: InputBorder.none,
                            hintText: 'Start typing...',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //desc
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
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          validator: (value) {
                            if (value!.isNotEmpty && value.length < 31) {
                              return null;
                            } else if (value.length > 30) {
                              return 'Name too long';
                            } else if (value.isEmpty) {
                              return 'Enter description';
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
                  //phone number
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
                          maxLines: null,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return null;
                            } else if (value
                                .contains(RegExp(r'^[A-Za-z0-9_.]+$'))) {
                              return 'Invalid phone number';
                            } else if (value.length == 8) {
                              return null;
                            } else {
                              return 'Invalid phone number';
                            }
                          },
                          controller: _numController,
                          decoration: InputDecoration(
                            labelText: 'Phone number',
                            border: InputBorder.none,
                            hintText: 'Leave blank if not needed',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //submit button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: () {
                        if (!_formkey.currentState!.validate()) {
                          return;
                        }
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Got it"),
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
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
