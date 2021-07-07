import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Table2 extends StatefulWidget {
  @override
  _Table2State createState() => _Table2State();
}

class _Table2State extends State<Table2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Test pills'),
      // ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('table2').snapshots(),
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