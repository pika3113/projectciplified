//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetActivitiesNum extends StatelessWidget {
  final String documentID;
  GetActivitiesNum({required this.documentID});

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
          if (data['name'].toString().contains('n')) {
            return Text(
              'Phone number not available',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w600),
            );
          } else {
            return Text(
              'Phone number: ${data['number']}',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w600),
            );
          }
        }
        return Text('loading...');
      }),
    );
  }
}
