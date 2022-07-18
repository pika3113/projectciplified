// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectciplified/screens/read%20data/get_activities_auth.dart';
import 'package:projectciplified/screens/read%20data/get_activities_desc.dart';
import 'package:projectciplified/screens/read%20data/get_activities_email.dart';
import 'package:projectciplified/screens/read%20data/get_activities_num.dart';
import 'package:projectciplified/screens/read%20data/get_activities_title.dart';
//import 'dart:html';

class Activities extends StatefulWidget {
  const Activities({Key? key}) : super(key: key);

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
//document IDs
  List<String> docIDs = [];

  //get docIDs

  Future getDocID() async {
    await FirebaseFirestore.instance.collection('activities').get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              docIDs.add(document.reference.id);
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: (Icon(Icons.local_activity_rounded)),
        title: Text(
          'Activities',
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
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getDocID(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: docIDs.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          print(docIDs[index]); //title
                        },

                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 8),
                          child: ListTile(
                            dense: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            tileColor: Color.fromARGB(255, 235, 235, 235),
                            title: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Title(
                                      color: Colors.black,
                                      child: GetActivities(
                                          documentID: docIDs[index]),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: GetActivitiesAuth(
                                        documentID: docIDs[index]),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),

                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: GetActivitiesDesc(
                                        documentID: docIDs[index]),
                                  ),

                                  SizedBox(
                                    height: 5,
                                  ),
                                  //contact details
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Contact details',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  //email
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: GetActivitiesEmail(
                                        documentID: docIDs[index]),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  //phone number
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: GetActivitiesNum(
                                        documentID: docIDs[index]),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),

                                  //sign up for the activity
                                  //'stuff already inside + 'user name' submit it to the thing .doc('')
                                ],
                              ),
                            ),
                          ),
                        ),

//delete here if needed^^
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
