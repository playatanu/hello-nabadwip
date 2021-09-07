import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nabadwip/colors/maincolors.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About App',
          style: TextStyle(color: blue),
        ),
        centerTitle: true,
        backgroundColor: bodycolor,
      ),
      backgroundColor: bodycolor,
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('places').snapshots(),
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot data = snapshot.data!.docs[index];

                  return FullListItemBuild(data: data);
                });
          },
        ),
      ),
    );
  }
}

class FullListItemBuild extends StatelessWidget {
  const FullListItemBuild({
    Key? key,
    required this.data,
  }) : super(key: key);

  final DocumentSnapshot<Object?> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: ListTile(
        title: Text(data['name']),
        subtitle: Text(data['tag']),
        trailing: Text('1.2km'),
      )),
    );
  }
}
