// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

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
        _emailcontroller.text.trim(),
        int.parse(
          _agecontroller.text.trim(),
        ),
      );
    }
  }

  Future addUserDetails(String name, String email, int age) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(_emailcontroller.text.trim())
        .set({
      'name': name,
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

  bool _passwordVisible = false;
  bool _1passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = true;
    _1passwordVisible = true;
  }

  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _firstNamecontroller.dispose();
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
                  //name textfield

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
                            if (value!.isNotEmpty && value.length > 6) {
                              return null;
                            } else if (value.length < 5 && value.isNotEmpty) {
                              return 'Name too short';
                            } else if (value.isEmpty) {
                              return 'Enter name';
                            } else {
                              return null;
                            }
                          },
                          controller: _firstNamecontroller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter name',
                            labelText: 'Name',
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
                              hintText: 'Enter age',
                              labelText: 'Age'),
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
                            hintText: 'Enter email',
                            labelText: 'Email',
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
                          obscureText: _passwordVisible,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: InputBorder.none,
                            hintText: 'Enter password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                //Based on passwordvisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                //Update the state ie toggle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
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
                              return "Enter your password again";
                            } else if (_passwordcontroller.text.trim() !=
                                _cfmpasswordcontroller.text.trim()) {
                              return 'Passwords do not match';
                            } else {
                              return null;
                            }
                          },
                          controller: _cfmpasswordcontroller,
                          obscureText: _1passwordVisible,
                          decoration: InputDecoration(
                            labelText: 'Confirm password',
                            border: InputBorder.none,
                            hintText: 'Enter password again',
                            suffixIcon: IconButton(
                              icon: Icon(
                                //Based on passwordvisible state choose the icon
                                _1passwordVisible
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                //Update the state ie toggle the state of passwordVisible variable
                                setState(() {
                                  _1passwordVisible = !_1passwordVisible;
                                });
                              },
                            ),
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
