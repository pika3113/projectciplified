import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ManagePassword extends StatefulWidget {
  final VoidCallback showManagePage;
  const ManagePassword({Key? key, required this.showManagePage})
      : super(key: key);

  @override
  State<ManagePassword> createState() => _ManagePasswordState();
}

class _ManagePasswordState extends State<ManagePassword> {
  bool passwordConfirmed() {
    if (_newPassword.text.trim() == _cfmPassword.text.trim() &&
        _newPassword.text.length > 6) {
      return true;
    } else {
      return false;
    }
  }

  //controllers
  final _originalPassword = TextEditingController();
  final _newPassword = TextEditingController();
  final _cfmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        leading: (GestureDetector(
          onTap: widget.showManagePage,
          child: Icon(Icons.arrow_back),
        )),
        centerTitle: true,
        title: Text(
          'Chaneg password',
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
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 90),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Change password text
                Text(
                  'Change password',
                  style: TextStyle(
                      fontSize: 34,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                //original password
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
                        controller: _originalPassword,
                        decoration: InputDecoration(
                          labelText: 'Original password',
                          border: InputBorder.none,
                          hintText: 'Enter original password',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                //new password
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
                            return "Enter new password";
                          } else if (value.length < 6) {
                            return 'Password has to be longer than 6 characters';
                          } else {
                            return null;
                          }
                        },
                        controller: _newPassword,
                        decoration: InputDecoration(
                          labelText: 'New password',
                          border: InputBorder.none,
                          hintText: 'Enter a new password',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                //cfm new password
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
                            return "Enter new password again";
                          } else if (_newPassword.text.trim() !=
                              _cfmPassword.text.trim()) {
                            return 'Passwords do not match';
                          } else {
                            return null;
                          }
                        },
                        controller: _cfmPassword,
                        decoration: InputDecoration(
                          labelText: 'Confirm new password',
                          border: InputBorder.none,
                          hintText: 'Enter new password again',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                //change password button

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      if (!_formkey.currentState!.validate()) {
                        return null;
                      }

                      //stuff to do goes here
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
                          'Change password',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
