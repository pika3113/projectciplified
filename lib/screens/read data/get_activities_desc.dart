import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:projectciplified/screens/navbar%20screens/expanded_widget.dart';

class GetActivitiesDesc extends StatelessWidget {
  final String documentID;
  GetActivitiesDesc({required this.documentID});

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
          return Expanded(
            child: SingleChildScrollView(
              child: ExpandedWidget(text: '${data['description']}'),
            ),
          );
        } else {
          return Text('loading...');
        }
      }),
    );
  }
}
