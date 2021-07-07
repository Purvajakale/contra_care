import 'package:contra_care/services/admin_faqs_update.dart';
import 'package:contra_care/services/admin_pills_update.dart';
import 'package:contra_care/services/pills1_update.dart';
import 'package:contra_care/services/faq1update.dart';
import 'package:contra_care/services/translate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          FlatButton(
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
                      children: [
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  new AlertDialog(
                                title: Text('${user.displayName}'),
                                content: new Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('${user.email}'),
                                  ],
                                ),
                                actions: <Widget>[
                                  new TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Close'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Text(
                            "My Profile",
                            style: TextStyle(fontSize: 23),
                          ),
                        ),
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
          child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(40),
              child: Text('welcome to ADMIN PAGE')),
          ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PillInfoUpdate())),
              child: Text('update data')),
          ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => App())),
              child: Text('Translate'))
        ],
      )),
    );
  }
}
