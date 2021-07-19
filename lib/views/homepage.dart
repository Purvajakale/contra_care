/*import 'package:contra_care/features/reminders/screens/home/home.dart';
import 'package:contra_care/services/translate.dart';
import 'package:contra_care/views/about_us.dart';
import 'package:contra_care/views/brandsinfo.dart';
import 'package:contra_care/views/carouselslider.dart';
import 'package:contra_care/views/data/readmore.dart';
import 'package:contra_care/views/faqs.dart';
import 'package:contra_care/views/home2.dart';
import 'package:contra_care/views/onboarding.dart';
import 'package:contra_care/views/queryform.dart';
import 'package:contra_care/views/translatordemo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

enum Category { FAQ, PILLS, ASKUS, PILLTRACKER }

class HomePage1 extends StatefulWidget {
  const HomePage1({Key key}) : super(key: key);

  @override
  _  HomePage1State createState() => _  HomePage1State();
}

class _  HomePage1State extends State<  HomePage1> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

  Future signOut() async {
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Logout'),
        content: Text(
            'You have been successfully logged out, now you will be redirected to HomePage1'),
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

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Onboarding()),
        );
      }
    });
  }

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
  void initState() {
    super.initState();
    this.checkAuthentication();
    this.getUser();
    super.initState();
  }

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // appBar: AppBar(
      //   brightness: Brightness.light,
      //   iconTheme: IconThemeData(color: Colors.white),
      //   backgroundColor: Color(0xffF5C0C0),
      //   elevation: 0,
      // ),
      drawer: Padding(
        padding: EdgeInsets.only(top: 26, bottom: 5),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Color(0xff96BAFF)),
          //color: Colors.white,
          // color: Color(0xff96BAFF),
          width: MediaQuery.of(context).size.width * 0.8,
          height: 800,
          child: ListView(
            children: [
              Container(
                height: 150,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xff96BAFF),
                      Colors.grey[100],
                    ]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/profile.png',
                        height: 100,
                        width: 80,
                      ),
                      SizedBox(
                        width: 3,
                      ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                              "My profile",
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
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
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => HomePage12()));
                },
                child: ListTile(
                  title: Text("Pills Tracker"),
                  trailing: Icon(Icons.alarm),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FaqsPage()));
                },
                child: ListTile(
                  title: Text("FAQs"),
                  trailing: Icon(Icons.info),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUs()));
                },
                child: ListTile(
                  title: Text("About Us"),
                  trailing: Icon(Icons.face),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PillsBrands()));
                },
                child: ListTile(
                  title: Text("Pills Info"),
                  trailing: Icon(Icons.medication),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FormFour()));
                },
                child: ListTile(
                  title: Text("Ask query"),
                  trailing: Icon(Icons.query_stats),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Demo()));
                },
                child: ListTile(
                  title: Text("Trial translate"),
                  trailing: Icon(Icons.translate),
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
      ),
      // backgroundColor: Color(0xfff8f8f8),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffF5C0C0),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                ),
                child: Container(
                  height: 200,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 36, right: 18, bottom: 30),
                  child: Row(
                    children: [
                      Text(
                        "Welcome to, \nContraCare!",
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                      ),
                      SizedBox(height: 20,)

                      // InkWell(
                      //     child: Image.asset("assets/images/img2.png"),
                      //     onTap: () {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => FaqsPage()),
                      //       );
                      //     }),
                    ],
                  ),
                ),
                  //margin: EdgeInsets.only(right: 40, top: 20, bottom: 20),
                  alignment: Alignment.centerLeft,
                  // decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //         image: AssetImage('assets/images/path.png'),
                  //         fit: BoxFit.contain)),
                ),
              

            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 200,),
                
                Container(
                  child: RecomendsPlants(),
                ),
                SizedBox(
                  height: 0,
                ),
                Padding(
                    padding: EdgeInsets.all(12),
                    child: Container(decoration:  BoxDecoration(borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)))
                      ,child: DemoApp()),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
*/