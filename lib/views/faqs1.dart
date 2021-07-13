import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FaqPage1 extends StatefulWidget {
  //const FaqPage1({ Key? key }) : super(key: key);

  @override
  _FaqPage1State createState() => _FaqPage1State();
}

class _FaqPage1State extends State<FaqPage1> {
  UniqueKey keyTile;
  bool isExpanded = false;

  void expandTile() {
    setState(() {
      isExpanded = true;
      keyTile = UniqueKey();
    });
  }

  void shrinkTile() {
    setState(() {
      isExpanded = false;
      keyTile = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('faqs1').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData)
              return Text('loading faqs');
            else {
              return Container(padding: EdgeInsets.only(top: 15),
                child: ListView.builder(
                    itemCount: snapshot.data.size,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Padding(padding: EdgeInsets.only(left:10,right: 10),
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                            shadowColor: Colors.indigoAccent,
                            elevation: 4,
                            child: ExpansionTile(
                              key: keyTile,
                              backgroundColor: Colors.transparent,
                              initiallyExpanded: isExpanded,
                              childrenPadding: EdgeInsets.all(18).copyWith(top: 0),
                              title: Text(
                                snapshot.data.docs[index]['ques'],
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              children: [
                                Text(
                                  snapshot.data.docs[index]['ans'],
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),padding: EdgeInsets.only(bottom: 5),
                      );
                    }),
              );
            }
          }),
    );
  }
}

     // child: ListTile(
                      //   title: Text(
                      //     snapshot.data.docs[index]['ques'],
                      //     style: TextStyle(fontSize: 20),
                      //   ),
                      //   subtitle: Text(
                      //     snapshot.data.docs[index]['ans'],
                      //     style: TextStyle(fontSize: 18),
                      // ),),

