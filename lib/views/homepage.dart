import 'dart:convert';
import 'package:contra_care/features/reminders/screens/home/home.dart';
import 'package:contra_care/services/translate.dart';
import 'package:contra_care/views/about_us.dart';
import 'package:contra_care/views/brandsinfo.dart';
import 'package:contra_care/views/data/readmore.dart';
import 'package:contra_care/views/faqs.dart';
import 'package:contra_care/views/queryform.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum Category { FAQ, PILLS, ASKUS, PILLTRACKER }

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User user;
  bool isloggedin = false;

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Contracare'),
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.indigo[500],
        elevation: 0,
      ),
      drawer: Container(
        color: Color(0xff96BAFF),
        width: MediaQuery.of(context).size.width * 0.8,
        child: ListView(
          children: [
            Container(
              height: 140,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  //color: Colors.grey,
                  gradient: LinearGradient(colors: [
                    Color(0xff96BAFF),
                    Colors.grey[100],
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
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PillsBrands()));
              },
              child: ListTile(
                title: Text("Pills Info"),
                trailing:
                Icon(Icons.medication),
            
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => App()));
              },
              child: ListTile(
                title: Text("Trial translate"),
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
              color: Colors.transparent,
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
                          Colors.lightBlue[400]),
                      buildPetCategory(Category.PILLS, "210", Colors.blue[200],
                          Colors.pink[300]),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildPetCategory(Category.ASKUS, "90", Colors.pink[200],
                          Colors.amber),
                      buildPetCategory(Category.PILLTRACKER, "340",
                          Colors.red[300], Colors.blueAccent),
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
           
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// import 'package:contra_care/features/reminders/screens/home/home.dart';
// import 'package:contra_care/services/translate.dart';
// import 'package:contra_care/views/about_us.dart';
// import 'package:contra_care/views/brandsinfo.dart';
// import 'package:contra_care/views/faqs.dart';
// import 'package:contra_care/views/home2.dart';
// import 'package:contra_care/views/queryform.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flushbar/flushbar.dart';
// import 'package:flutter/material.dart';
// import 'package:contra_care/views/onboarding.dart';
// import 'package:contra_care/views/data/data.dart';
// import 'package:contra_care/views/data/name.dart';
// import 'package:contra_care/views/data/readmore.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   User user;
//   bool isloggedin = false;

// //for trial
//   List<SpecialityModel> specialities;

//   checkAuthentication() async {
//     _auth.authStateChanges().listen((user) {
//       if (user == null) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => Onboarding()),
//         );
//       }
//     });
//   }

//   getUser() async {
//     User firebaseUser = _auth.currentUser;
//     await firebaseUser?.reload();
//     firebaseUser = _auth.currentUser;

//     if (firebaseUser != null) {
//       setState(() {
//         this.user = firebaseUser;
//         this.isloggedin = true;
//       });
//     }
//   }

//   Future signOut() async {
//     await showDialog(
//       context: context,
//       builder: (ctx) => AlertDialog(
//         title: Text('Logout'),
//         content: Text(
//             'You have been successfully logged out, now you will be redirected to Homepage'),
//         actions: <Widget>[
//           FlatButton(
//             onPressed: () {
//               Navigator.of(ctx).pop();
//             },
//             child: Text('OK'),
//           )
//         ],
//       ),
//     );
//     return await _auth.signOut();
//   }
 

//   @override
//   void initState() {
//     super.initState();
//     this.checkAuthentication();
//     this.getUser();

//     super.initState();

//     specialities = getSpeciality();
//   }

//   GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       appBar: AppBar(
//         title: Text("Contracare"),
//         backgroundColor: Colors.teal,
//         actions: [IconButton(icon: Icon(Icons.logout), onPressed: signOut)],
//       ),
//       drawer: Container(
//         color: Colors.tealAccent[700],
//         width: 320,
//         child: ListView(
//           children: [
//             Container(
//               height: 140,
//               child: DrawerHeader(
//                 decoration: BoxDecoration(
//                   //color: Colors.grey,
//                   gradient:
//               LinearGradient(colors: [ Colors.grey[50],Colors.tealAccent[700],]),
//                   borderRadius: BorderRadius.circular(14),
//                 ),
                
//                   child: Row(
//                     children: [
//                       Image.asset(
//                         'assets/images/profile.png',
//                         height: 100,
//                         width: 80,
//                       ),
//                       SizedBox(width: 3,),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           TextButton(
//                             onPressed: () {
//                               showDialog(
//                                 context: context,
//                                 builder: (BuildContext context) =>
//                                     new AlertDialog(
//                                   //title: Text('${user.displayName}'),
//                                   content: new Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: <Widget>[
//                                       Text('${user.email}'),
//                                     ],
//                                   ),
//                                   actions: <Widget>[
//                                     new TextButton(
//                                       onPressed: () {
//                                         Navigator.of(context).pop();
//                                       },
//                                       child: const Text('Close'),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                             child: Text(
//                               "My profile",
//                               style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.black),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
            
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => Home()));
//               },
//               child: ListTile(
//                 title: Text("Pills Tracker"),
//                 trailing: Icon(Icons.alarm),
                
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => HomePage()));
//               },
//               child: ListTile(
//                 title: Text("Pills Tracker"),
//                 trailing: Icon(Icons.alarm),
                
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => FaqsPage()));
//               },
//               child: ListTile(
//                 title: Text("FAQs"),
//                 trailing: 
//                   Icon(Icons.info),
                
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                  Navigator.push(context,
//                      MaterialPageRoute(builder: (context) => AboutUs()));
//               },
//               child: ListTile(
//                 title: Text("About Us"),
//                 trailing: 
//                    Icon(Icons.face),
                
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                  Navigator.push(context,
//                      MaterialPageRoute(builder: (context) => PillsBrands()));
//               },
//               child: ListTile(
//                 title: Text("Pills Info"),
//                 trailing: 
//                   Icon(Icons.medication),
                
//               ),
//             ),
            
//             TextButton(
//               onPressed: () {
//                 Navigator.push(context,
//                      MaterialPageRoute(builder: (context) => FormFour()));
//               },
//               child: ListTile(
//                 title: Text("Ask query"),
//                 trailing: 
//                    Icon(Icons.query_stats),
                
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 FirebaseAuth.instance.signOut();
//                 Navigator.pop(context);
//               },
//               child: ListTile(
//                 title: Text("Logout"),
//                 trailing: 
//                    Icon(Icons.logout),
                
//               ),
//             ),
//           ],
//         ),
//       ),

// ///////////////////////////////////////////////////////////////////drawer////////////////////////////////////////////

//       body: Container(
//         child: Padding(
//           padding: EdgeInsets.all(10),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               // color: Colors.teal[100],
//               children: <Widget>[
//                 Flexible(
//                   child: Card(
//                     child: Container(
//                       height: 230,
//                       child: ListView.builder(
//                           itemCount: specialities.length,
//                           shrinkWrap: true,
//                           physics: ClampingScrollPhysics(),
//                           scrollDirection: Axis.horizontal,
//                           itemBuilder: (context, index) {
//                             return SpecialistTile(
//                               imgAssetPath: specialities[index].imgAssetPath,
//                               navPath:specialities[index].navPath,
//                               speciality: specialities[index].speciality,
//                               noOfDoctors: specialities[index].noOfDoctors,
//                               backColor: specialities[index].backgroundColor,
//                             );
//                           }),
//                       // color: Colors.teal[100],
//                     ),
//                   ),
//                 ),
//                 Divider(
//                   color: Colors.transparent,
//                   thickness: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: Container(
//                     color: Colors.transparent,
//                     child: DemoApp(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SpecialistTile extends StatelessWidget {
//   final String imgAssetPath;
//   final String speciality;
//   final int noOfDoctors;
//   final Color backColor;
//   final navPath;

//   BuildContext context;
//   SpecialistTile(
//       {@required this.imgAssetPath,
//       @required this.navPath,
//       @required this.speciality,
//       @required this.noOfDoctors,
//       @required this.backColor});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 150,
//       margin: EdgeInsets.only(right: 16),
//       decoration: BoxDecoration(
//           color: backColor, borderRadius: BorderRadius.circular(24)),
//       padding: EdgeInsets.only(top: 20, right: 20, left: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[TextButton(onPressed: (){ Navigator.push(
//         context, MaterialPageRoute(builder: (context) => Home()));}, child: Text('button')),
//           Text(
//             speciality,
//             style: TextStyle(
//                 color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(
//             height: 6,
//           ),
//           // Text(
//           //   "$noOfDoctors Doctors",
//           //   style: TextStyle(color: Colors.white, fontSize: 13),
//           // ),
//           Image.asset(
//             imgAssetPath,
//             height: 105,
//             fit: BoxFit.fitHeight,
            
//           )
//         ],
//       ),
//     );
//   }
// }



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