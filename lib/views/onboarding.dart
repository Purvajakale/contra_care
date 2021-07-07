import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:contra_care/views/homepage.dart';
import '../account_pages/login.dart';
import 'package:contra_care/services/anon_auth.dart';
import 'package:contra_care/features/reminders/screens/home/home.dart';


class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: HomeController(),
    );
  }
}

class onboarding extends StatefulWidget {
  @override
  _onboardingState createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  final AuthService _auth = AuthService();

  int currentPage = 0;
  PageController _pageController =
  new PageController(initialPage: 0, keepPage: true);



  @override
  Widget build(BuildContext context) {

    final login = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff82b67c),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width*0.55,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: openLoginPage,
        child: Text("Login in",
          textAlign: TextAlign.center,
        ),
      ),
    );

    final loginanon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff82b67c),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width*0.55,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () async {
              alertbox();
              dynamic result = await _auth.signInAnon();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),);
              if(result == null){
                print('error signing in');
              } else {
                print('signed in');
                print(result);
              }
            },
        child: Text("Login as a guest",
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Scaffold(
      body: Stack(
        children: [


          Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/background-3.jpeg'),
                fit: BoxFit.cover)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: PageView(
                  controller: _pageController,
                  children: [
                    onBoardPage("onboard1"),
                    onBoardPage("onboard2"),
                    onBoardPage("onboard3"),
                  ],
                  onPageChanged: (value) => {setCurrentPage(value)},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) => getIndicator(index)),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  login,
                  SizedBox(
                    height: 10,
                  ),
                  // ignore: missing_required_param
                  TextButton(
                    child: Text(
                      "Don't want to create an account?",
                      style: TextStyle(
                          color: Colors.black38),
                    ),
                  ),
                  loginanon,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  AnimatedContainer getIndicator(int pageNo) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: 10,
      width: (currentPage == pageNo) ? 20 : 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: (currentPage == pageNo) ? Colors.black : Colors.grey),
    );
  }

  Column onBoardPage(String img) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          height: 180,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/$img.png'))),
        ),
      ],
    );
  }

  setCurrentPage(int value) {
    currentPage = value;
    setState(() {});
  }

  Future alertbox() async {
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Alert'),
        content: Text('Oral Contraceptive pills are intended to be used to prevent pregnancy. Pills DO NOT protect against transmission of HIV (AIDS) or any other Sexually Transmitted Disease.'),
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
  }

  openLoginPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Login()));
    alertbox();
  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final AuthService auth = Provider.of(context).auth;
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          if (user == null) {
            return onboarding();
            // return Home();
          } else {
            return HomePage();
          }
          // return user ? Home() : SignUpView();
        }
        return CircularProgressIndicator();
      },
    );
  }
}