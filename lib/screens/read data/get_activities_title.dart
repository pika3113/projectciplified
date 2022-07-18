//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetActivities extends StatelessWidget {
  final String documentID;
  GetActivities({required this.documentID});

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
            '${data['title']}',
            style: TextStyle(fontSize: 18, fontFamily: 'Paytone'),
          );
        }
        return Text('loading...');
      }),
    );
  }
}
