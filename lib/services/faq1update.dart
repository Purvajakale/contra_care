import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Faq1Update extends StatefulWidget {
  const Faq1Update({ Key key }) : super(key: key);

  @override
  _Faq1UpdateState createState() => _Faq1UpdateState();
}

class _Faq1UpdateState extends State<Faq1Update> {
  String id;
  final db = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  String ques,ans;

  Card buildItem(DocumentSnapshot doc) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'question: ${doc['ques']}',
              style: TextStyle(fontSize: 15),
            ),SizedBox(height: 5),
            Text(
              'answer: ${doc['ans']}',
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
        hintText: 'question',
        fillColor: Colors.grey[300],
        filled: true,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
      },
      onSaved: (value) => ques = value,
    );
  }

    TextFormField buildTextFormField2() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'answer',
        fillColor: Colors.grey[300],
        filled: true,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
      },
      onSaved: (value) => ans = value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(children:<Widget>[buildTextFormField(),buildTextFormField2()], ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: createData,
                child: Text('Create', style: TextStyle(color: Colors.white)),
                color: Colors.green,
              ),
              // RaisedButton(
              //   onPressed: id != null ? readData : null,
              //   child: Text('Read', style: TextStyle(color: Colors.white)),
              //   color: Colors.blue,
              // ),
            ],
          ),
          StreamBuilder<QuerySnapshot>(
            stream: db.collection('faqs1').snapshots(),
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
    );
  }

  void createData() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      DocumentReference ref = await db
          .collection('faqs1')
          .add({'ques': ques,'ans':ans});
      setState(() => id = ref.id);
      print(ref.id);
    }
  }

  void readData() async {
    DocumentSnapshot snapshot = await db.collection('faqs1').doc(id).get();
   // print(snapshot.data['ques']);
  }

  void updateData(DocumentSnapshot doc) async {
    await db
        .collection('faqs1')
        .doc(doc.id);
  }

  void deleteData(DocumentSnapshot doc) async {
    await db.collection('faqs1').doc(doc.id).delete();
    setState(() => id = null);
  }
}