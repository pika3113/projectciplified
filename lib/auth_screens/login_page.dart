// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//text controller
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailcontroller.text.trim(),
      password: _passwordcontroller.text.trim(),
    );
  }

  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = true;
  }

  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.phone_android_rounded,
                    size: 100,
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    '(student)',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //Hello again!
                  Text(
                    'Hello again!',
                    style: TextStyle(
                        fontSize: 54,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Welcome back, you\'ve been missed!',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 50,
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
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w600),
                          validator: (value) {
                            if (value!.isNotEmpty &&
                                value.length > 3 &&
                                value.contains('@')) {
                              return null;
                            } else if (value.length < 4 && value.isNotEmpty) {
                              return 'Invalid email';
                            } else if (value.isEmpty) {
                              return 'Enter email';
                            } else {
                              return null;
                            }
                          },
                          controller: _emailcontroller,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: InputBorder.none,
                            hintText: 'Enter email',
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
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w600),
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
                  //sign in button

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: () {
                        if (!_formkey.currentState!.validate()) {
                          return;
                        }

                        signIn();
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
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w600,
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
                  //register button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: widget.showRegisterPage,
                        child: Text(
                          ' Register now',
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
