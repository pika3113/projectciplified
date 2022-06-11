// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectciplified/screens/navbar%20screens/controlling_page.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({
    Key? key,
    required this.showLoginPage,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controller
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _cfmpasswordcontroller = TextEditingController();
  final _firstNamecontroller = TextEditingController();
  final _lastNamecontroller = TextEditingController();
  final _agecontroller = TextEditingController();

  Future signUp() async {
    //create user
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim(),
      );

      //add user details
      addUserDetails(
        _firstNamecontroller.text.trim(),
        _lastNamecontroller.text.trim(),
        _emailcontroller.text.trim(),
        int.parse(
          _agecontroller.text.trim(),
        ),
      );
    }
  }

  Future addUserDetails(
      String firstName, String lastName, String email, int age) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'age': age,
    });
  }

  bool passwordConfirmed() {
    if (_passwordcontroller.text.trim() == _cfmpasswordcontroller.text.trim() &&
        _passwordcontroller.text.length > 6) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _firstNamecontroller.dispose();
    _lastNamecontroller.dispose();
    _agecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  //Hello again!
                  Text(
                    'Hello There!',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 54,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Register below with your details',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  //textfields
                  //first name textfield

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
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isNotEmpty && value.length > 3) {
                              return null;
                            } else if (value.length < 2 && value.isNotEmpty) {
                              return 'Invalid first name';
                            } else if (value.isEmpty) {
                              return 'Enter first name';
                            } else {
                              return null;
                            }
                          },
                          controller: _firstNamecontroller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'First Name',
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  //lastname textfield

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
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isNotEmpty && value.length > 3) {
                              return null;
                            } else if (value.length < 1 && value.isNotEmpty) {
                              return 'Invalid last name';
                            } else if (value.isEmpty) {
                              return 'Enter last name';
                            } else {
                              return null;
                            }
                          },
                          controller: _lastNamecontroller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Last Name',
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  //age textfield

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
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isNotEmpty &&
                                value.length < 3 &&
                                value.contains(RegExp(r'[0-9]'))) {
                              return null;
                            } else if (value.length > 2 && value.isNotEmpty ||
                                value.contains(RegExp(r'^[A-Za-z0-9_.]+$'))) {
                              return 'Invalid age';
                            } else if (value.isEmpty) {
                              return 'Enter age';
                            } else {
                              return "null";
                            }
                          },
                          controller: _agecontroller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Age',
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  //email textfield

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
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isNotEmpty &&
                                value.length > 3 &&
                                value.contains('@')) {
                              return null;
                            } else if (value.length < 4 && value.isNotEmpty) {
                              return 'Invalid email';
                            } else if (value.contains('@')) {
                              return null;
                            } else if (value.isEmpty) {
                              return 'Enter email';
                            } else {
                              return 'Invalid email';
                            }
                          },
                          controller: _emailcontroller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  //password textfield

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
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter password";
                            } else if (value.length < 6) {
                              return 'Password has to be longer than 6 characters';
                            } else {
                              return null;
                            }
                          },
                          controller: _passwordcontroller,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //cfmpassword textfield

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
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter password";
                            } else if (value.length < 6) {
                              return 'Password has to be longer than 6 characters';
                            } else {
                              return null;
                            }
                          },
                          controller: _cfmpasswordcontroller,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Confirm Password',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //sign up button

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
                        signUp();
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
                            'Sign Up',
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
                  SizedBox(
                    height: 25,
                  ),
                  //login button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'I am a member',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: widget.showLoginPage,
                        child: Text(
                          ' Login now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ), //
    );
  }
}
