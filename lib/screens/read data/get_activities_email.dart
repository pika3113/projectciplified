//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetActivitiesEmail extends StatelessWidget {
  final String documentID;
  GetActivitiesEmail({required this.documentID});

  @override
  Widget build(BuildContext context) {
    //get the collection
    CollectionReference users =
        FirebaseFirestore.instance.collection('activities');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentID).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          return Text(
            'Email: ${data['email']}',
            style: TextStyle(
                fontSize: 12,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w600),
          );
        }
        return Text('loading...');
      }),
    );
  }
}
