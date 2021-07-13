import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contra_care/services/admin_faqs_update.dart';
import 'package:contra_care/services/admin_pills_update.dart';
import 'package:contra_care/services/translate.dart';
import 'package:contra_care/views/user_queries.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic_container/neumorphic_container.dart';

class AdminPanel extends StatefulWidget {
  //const AdminPanel({ Key? key }) : super(key: key);

  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signOut() async {
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Logout'),
        content: Text(
            'You have been successfully logged out, now you will be redirected to Homepage'),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text('OK'),
          )
        ],
      ),
    );
    return await _auth.signOut();
  }
 

  User user;
  bool isloggedin = false;
  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('admin'),
          actions: [IconButton(icon: Icon(Icons.logout), onPressed: signOut)]),
      drawer: Container(
        color: Colors.white,
        width: 250,
        child: ListView(
          children: [
            Container(
              height: 160,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/profile.png',
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(width: 3),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('  Admin',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold))
                        // TextButton(
                        //   onPressed: () {
                        //     showDialog(
                        //       context: context,
                        //       builder: (BuildContext context) =>
                        //           new AlertDialog(
                        //         title: Text('${user.displayName}'),
                        //         content: new Column(
                        //           mainAxisSize: MainAxisSize.min,
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: <Widget>[
                        //             Text('${user.email}'),
                        //           ],
                        //         ),
                        //         actions: <Widget>[
                        //           new TextButton(
                        //             onPressed: () {
                        //               Navigator.of(context).pop();
                        //             },
                        //             child: const Text('Close'),
                        //           ),
                        //         ],
                        //       ),
                        //     );
                        //   },
                        //   child: Text(
                        //     "Contracare Admin",
                        //     style: TextStyle(fontSize: 23),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PillInfoUpdate()));
              },
              child: ListTile(
                title: Text("Update Pills data"),
                trailing: Icon(Icons.medication),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FaqUpdate()));
              },
              child: ListTile(
                title: Text("Update FAQs"),
                trailing: Icon(Icons.info),
              ),
            ),
              TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserQuery()));
              },
              child: ListTile(
                title: Text("User queries"),
                trailing: Icon(Icons.query_builder),
              ),
            ),
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              },
              child: ListTile(
                title: Text("Logout"),
                trailing: Icon(Icons.logout),
              ),
            ),
          ],
        ),
      ),
     body: Container(
       child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return Text('loading users');
                return ListView.builder(
                    itemCount: snapshot.data.size,
                    itemBuilder: (context, index) {
                      return Container(
                        // child: ListTile(
                        //
                        //   title: Text(
                        //     snapshot.data.docs[index]['name'],
                        //     style: TextStyle(fontSize: 20),
                        //   ),
                        // ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: NeumorphicContainer(
                            height: 50,
                            width: 60,
                            borderRadius: 150,
                            depth: 20,
                            primaryColor: Colors.white,
                            borderColor: Colors.indigo,
                            borderThickness: 1,
                            curvature: Curvature.flat,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, top: 13),
            
                              child: Text(snapshot.data.docs[index]['name'],
                              style: TextStyle(fontSize: 17),),
                            ),
                          ),
                        ),
                      );
                    });
              }
       ),
     ),
    );
  }
}
