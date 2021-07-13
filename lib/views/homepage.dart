import 'package:contra_care/features/reminders/screens/home/home.dart';
import 'package:contra_care/services/translate.dart';
import 'package:contra_care/views/about_us.dart';
import 'package:contra_care/views/brandsinfo.dart';
import 'package:contra_care/views/data/readmore.dart';
import 'package:contra_care/views/faqs.dart';
import 'package:contra_care/views/onboarding.dart';
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

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;


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
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xffF5C0C0),
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
      // backgroundColor: Color(0xfff8f8f8),
      body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height*0.45,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xffF5C0C0),
                  child: Container(
                    margin: EdgeInsets.only(right: 40, top: 20, bottom: 20),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/path.png'),
                            fit: BoxFit.contain
                        )
                    ),
                  ),
                )
              ],
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
              children: <Widget>[
                SizedBox(height: 50,),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(20).copyWith(top: 0),
                  child: Text("Welcome to \nCONTRACARE", style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                    color: Colors.white,

                  ),),
                ),
                SizedBox(height: 30,),
                Column(
                    children: [

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildPetCategory(Category.FAQ, Colors.orange[200],
                                    Colors.lightBlue[400]),
                                buildPetCategory(Category.PILLS, Colors.blue[200],
                                    Colors.pink[300]),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildPetCategory(Category.ASKUS,  Colors.pink[200],
                                    Colors.amber),
                                buildPetCategory(Category.PILLTRACKER,
                                    Colors.red[200], Colors.blueAccent),
                              ],
                            ),
                          ],
                        ),
                      ),


                      Divider(
                        color: Colors.deepPurpleAccent.shade100,
                        thickness: 5,
                        indent: 70,
                        endIndent: 70,
                      ),
                      Padding(

                        padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
                        child: Container(
                            color: Colors.transparent,
                            child: DemoApp()
                        ),
                      ),
                    ],
                  ),
              ],
            )
            ),

              Column(
                children: [
                  Container(
                    color: Colors.blueGrey,
                  ),
                ],
              ),
          ],
        ),
    );
  }


  Widget buildPetCategory(
      Category category, Color color, Color color2) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          height: 100,
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
                height: 58,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(0.5),
                ),
                child: Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
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
                        : "Pill \nTracker"),
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 17,
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


  Container categoryWidget(String img, String title)
  {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
      width: MediaQuery.of(context).size.width*0.3,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 1,
            offset: Offset(0,10),
          )]
      ),
      child: InkWell(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/$img.png'),
                        fit: BoxFit.contain
                    )
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(20),
              child: Text('$title', style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }


}