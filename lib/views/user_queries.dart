import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserQuery extends StatefulWidget {
  @override
  _UserQueryState createState() => _UserQueryState();
}

class _UserQueryState extends State<UserQuery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Test UserQuery'),
      // ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('query').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return Text('loading UserQuery');
            return ListView.builder(
                itemCount: snapshot.data.size,
                itemBuilder: (context, index) {
                  return Container(
                    child: ListTile(
                      title: Text(
                        snapshot.data.docs[index]['name'],
                        style: TextStyle(fontSize: 20),
                      ),subtitle: Text(
                        snapshot.data.docs[index]['desc'],
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}