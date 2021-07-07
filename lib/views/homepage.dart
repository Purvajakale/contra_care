import 'package:contra_care/features/reminders/screens/home/home.dart';
import 'package:contra_care/services/translate.dart';
import 'package:contra_care/views/about_us.dart';
import 'package:contra_care/views/brandsinfo.dart';
import 'package:contra_care/views/faqs.dart';
import 'package:contra_care/views/queryform.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:contra_care/views/onboarding.dart';
import 'package:contra_care/views/data/data.dart';
import 'package:contra_care/views/data/name.dart';
import 'package:contra_care/views/data/readmore.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

//for trial
  List<SpecialityModel> specialities;

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

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
    this.getUser();

    // TODO: implement initState
    super.initState();

    specialities = getSpeciality();
  }

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Contracare"),
        backgroundColor: Colors.teal,
        actions: [IconButton(icon: Icon(Icons.logout), onPressed: signOut)],
      ),
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
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
                trailing: 
                  Icon(Icons.info),
                
              ),
            ),
            TextButton(
              onPressed: () {
                 Navigator.push(context,
                     MaterialPageRoute(builder: (context) => AboutUs()));
              },
              child: ListTile(
                title: Text("About Us"),
                trailing: 
                   Icon(Icons.face),
                
              ),
            ),
            TextButton(
              onPressed: () {
                 Navigator.push(context,
                     MaterialPageRoute(builder: (context) => MyStatefulWidget()));
              },
              child: ListTile(
                title: Text("Pills Info"),
                trailing: 
                  Icon(Icons.medication),
                
              ),
            ),
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              },
              child: ListTile(
                title: Text("Logout"),
                trailing: 
                   Icon(Icons.logout),
                
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                     MaterialPageRoute(builder: (context) => FormFour()));
              },
              child: ListTile(
                title: Text("Ask query"),
                trailing: 
                   Icon(Icons.query_stats),
                
              ),
            ),
          ],
        ),
      ),

///////////////////////////////////////////////////////////////////drawer////////////////////////////////////////////

      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              // color: Colors.teal[100],
              children: <Widget>[
                Flexible(
                  child: Card(
                    child: Container(
                      height: 250,
                      child: ListView.builder(
                          itemCount: specialities.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return SpecialistTile(
                              imgAssetPath: specialities[index].imgAssetPath,
                              speciality: specialities[index].speciality,
                              noOfDoctors: specialities[index].noOfDoctors,
                              backColor: specialities[index].backgroundColor,
                            );
                          }),
                      // color: Colors.teal[100],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.transparent,
                  thickness: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    color: Colors.transparent,
                    child: DemoApp(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SpecialistTile extends StatelessWidget {
  final String imgAssetPath;
  final String speciality;
  final int noOfDoctors;
  final Color backColor;
  SpecialistTile(
      {@required this.imgAssetPath,
      @required this.speciality,
      @required this.noOfDoctors,
      @required this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          color: backColor, borderRadius: BorderRadius.circular(24)),
      padding: EdgeInsets.only(top: 20, right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            speciality,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 6,
          ),
          // Text(
          //   "$noOfDoctors Doctors",
          //   style: TextStyle(color: Colors.white, fontSize: 13),
          // ),
          Image.asset(
            imgAssetPath,
            height: 125,
            fit: BoxFit.fitHeight,
          )
        ],
      ),
    );
  }
}



/*

import 'package:contra_care/features/faq_section/faq_page.dart';
import 'package:contra_care/features/faq_section/sheets_api.dart';
import 'package:contra_care/features/reminders/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:contra_care/account_pages/onboarding.dart';
// import 'package:contra_care/views/faq.dart';
import 'package:contra_care/views/data.dart';
import 'package:contra_care/views/name.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

//for trial
  List<SpecialityModel> specialities;

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

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
    this.getUser();

    // TODO: implement initState
    super.initState();

    specialities = getSpeciality();
  }

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text("Contracare"),
          backgroundColor: Colors.teal,
          actions: [IconButton(icon: Icon(Icons.logout), onPressed: signOut)],
        ),
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
                onPressed: () {Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));},
                child: ListTile(
                  title: Text("Pills Tracker"),
                  trailing: TextButton(
                    child: Icon(Icons.history),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FaqPage()));},
                child: ListTile(
                  title: Text("FAQs"),
                  trailing: TextButton(
                    child: Icon(Icons.info),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                },
                child: ListTile(
                  title: Text("Logout"),
                  trailing: TextButton(
                    child: Icon(Icons.logout),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            // color: Colors.teal[100],
            child: Container(
              height: 250,
              child: ListView.builder(
                  itemCount: specialities.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SpecialistTile(
                      imgAssetPath: specialities[index].imgAssetPath,
                      speciality: specialities[index].speciality,
                      noOfDoctors: specialities[index].noOfDoctors,
                      backColor: specialities[index].backgroundColor,
                    );
                  }),
              // color: Colors.teal[100],
            ),
          ),
        ));
  }
}

class SpecialistTile extends StatelessWidget {
  final String imgAssetPath;
  final String speciality;
  final int noOfDoctors;
  final Color backColor;
  SpecialistTile(
      {@required this.imgAssetPath,
      @required this.speciality,
      @required this.noOfDoctors,
      @required this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          color: backColor, borderRadius: BorderRadius.circular(24)),
      padding: EdgeInsets.only(top: 20, right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            speciality,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 6,
          ),
          // Text(
          //   "$noOfDoctors Doctors",
          //   style: TextStyle(color: Colors.white, fontSize: 13),
          // ),
          Image.asset(
            imgAssetPath,
            height: 125,
            fit: BoxFit.fitHeight,
          )
        ],
      ),
    );
  }
}*/