import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Pills extends StatefulWidget {
  @override
  _PillsState createState() => _PillsState();
}

class _PillsState extends State<Pills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Test pills'),
      // ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('table1').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return Text('loading pills');
            return ListView.builder(
                itemCount: snapshot.data.size,
                itemBuilder: (context, index) {
                  return Container(
                    child: ListTile(
                      title: Text(
                        snapshot.data.docs[index]['name'],
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}