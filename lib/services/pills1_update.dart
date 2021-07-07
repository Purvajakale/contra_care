import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Pills1Update extends StatefulWidget {
  @override
  Pills1UpdateState createState() {
    return Pills1UpdateState();
  }
}

class Pills1UpdateState extends State<Pills1Update> {
  String id;
  final db = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  String name;

  Card buildItem(DocumentSnapshot doc) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              doc['name'],
              style: TextStyle(fontSize: 15),
            ),
        
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () => updateData(doc),
                  child: Text('Update ',
                      style: TextStyle(color: Colors.white)),
                  color: Colors.green,
                ),
                SizedBox(width: 8),
                FlatButton(
                  onPressed: () => deleteData(doc),
                  child: Text('Delete'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  TextFormField buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'name',
        fillColor: Colors.grey[300],
        filled: true,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
      },
      onSaved: (value) => name = value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(8),
          children: <Widget>[
            Form(
              key: _formKey,
              child: buildTextFormField(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: createData,
                  child: Text('Create', style: TextStyle(color: Colors.white)),
                  color: Colors.greenAccent[700],
                ),
                RaisedButton(
                  onPressed: id != null ? readData :readData,
                  child: Text('Read', style: TextStyle(color: Colors.white)),
                  color: Colors.blue,
                ),
              ],
            ),
            StreamBuilder<QuerySnapshot>(
              stream: db.collection('table1').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                      children: snapshot.data.docs
                          .map((doc) => buildItem(doc))
                          .toList());
                } else {
                  return SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  void createData() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      DocumentReference ref = await db
          .collection('table1')
          .add({'name':name});
      setState(() => id = ref.id);
      print(ref.id);
    }
  }

  void readData() async {
    DocumentSnapshot snapshot = await db.collection('table1').doc(id).get();
   // print(snapshot.data['name']);
  }

  void updateData(DocumentSnapshot doc) async {
    await db
        .collection('table1')
        .doc(doc.id);
  }

  void deleteData(DocumentSnapshot doc) async {
    await db.collection('table1').doc(doc.id).delete();
    setState(() => id = null);
  }
}
