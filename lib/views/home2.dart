import 'dart:convert';

import 'package:contra_care/features/reminders/screens/home/home.dart';

import 'package:contra_care/views/about_us.dart';
import 'package:contra_care/views/brandsinfo.dart';
import 'package:contra_care/views/data/readmore.dart';
import 'package:contra_care/views/faqs.dart';

import 'package:contra_care/views/queryform.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum Category { FAQ, PILLS, ASKUS, PILLTRACKER }

class HomePage2 extends StatefulWidget {
  const HomePage2({Key key}) : super(key: key);

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  User user;
  bool isloggedin = false;

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: Text('Contracare'),
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.teal),
        backgroundColor: Colors.tealAccent[700],
        elevation: 0,
      ),
      drawer: Container(
        color: Colors.tealAccent[700],
        width: MediaQuery.of(context).size.width * 0.8,
        child: ListView(
          children: [
            Container(
              height: 140,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  //color: Colors.grey,
                  gradient: LinearGradient(colors: [
                    Colors.grey[50],
                    Colors.tealAccent[700],
                  ]),
                  borderRadius: BorderRadius.circular(14),
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
                                //title: Text('${user.displayName}'),
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
            // TextButton(
            //   onPressed: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => PillsBrands()));
            //   },
            //   child: ListTile(
            //     title: Text("Pills Info"),
            //     trailing:
            //     Icon(Icons.medication),
            //
            //   ),
            // ),

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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.teal[100],
              child: Column(
                children: [
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 16),
                    // child: Text(
                    //   "Contracare",
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 24,
                    //   ),
                    // ),
                  // ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Know more about contraceptive pills!",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Features",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildPetCategory(Category.FAQ, "56", Colors.orange[200],
                          Colors.teal[200]),
                      buildPetCategory(Category.PILLS, "210", Colors.blue[200],
                          Colors.lightGreen[400]),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildPetCategory(Category.ASKUS, "90", Colors.green[200],
                          Colors.amber),
                      buildPetCategory(Category.PILLTRACKER, "340",
                          Colors.red[300], Colors.blueAccent[200]),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.transparent,
              thickness: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(color: Colors.transparent, child: DemoApp()),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPetCategory(
      Category category, String total, Color color, Color color2) {
    return Expanded(
      child: GestureDetector(
        // onTap: () {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => CategoryList(category:Category.FAQ )),
        //   );
        // },
        child: Container(
          height: 80,
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color2.withOpacity(0.5),
            border: Border.all(
              color: Colors.grey[200],
              width: 1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            children: [
              Container(
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(0.5),
                ),
                child: Center(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset(
                      "assets/images/" +
                          (category == Category.FAQ
                              ? "cream"
                              : category == Category.PILLS
                                  ? "capsule"
                                  : category == Category.ASKUS
                                      ? "drops"
                                      : "syringe") +
                          ".png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    (category == Category.FAQ
                        ? "FAQ"
                        : category == Category.PILLS
                            ? "Pills Info"
                            : category == Category.ASKUS
                                ? "Ask Us"
                                : "Pill Tracker"),
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Text(
                  //   (category == Category.FAQ
                  //       ? "background"
                  //       : category == Category.PILLS
                  //           ? "background-2"
                  //           : category == Category.ASKUS
                  //               ? "onboard1"
                  //               : "onboard2"),
                  //   style: TextStyle(
                  //     color: Colors.grey[600],
                  //     fontSize: 14,
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
