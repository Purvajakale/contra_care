import 'package:contra_care/account_pages/login1.dart';
import 'package:contra_care/account_pages/newpage.dart';
import 'package:contra_care/views/home2.dart';
import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:contra_care/services/anon_auth.dart';
import 'package:contra_care/account_pages/login.dart';
import 'intro_screen.dart';
import 'intro_screens.dart';

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

class OnBoardPage extends StatefulWidget {
  @override
  OnBoardPageState createState() {
    return OnBoardPageState();
  }
}

class OnBoardPageState extends State<OnBoardPage> with TickerProviderStateMixin {
  final AuthService _auth = AuthService();

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

    // final loginanon = Material(
    //   elevation: 5.0,
    //   borderRadius: BorderRadius.circular(30.0),
    //   color: Color(0xff82b67c),
    //   child: MaterialButton(
    //     minWidth: MediaQuery.of(context).size.width*0.55,
    //     padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    //     onPressed: () async {
    //       alertbox();
    //       dynamic result = await _auth.signInAnon();
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(builder: (context) => HomePage()),);
    //       if(result == null){
    //         print('error signing in');
    //       } else {
    //         print('signed in');
    //         print(result);
    //       }
    //     },
    //     child: Text("Login as a guest",
    //       textAlign: TextAlign.center,
    //     ),
    //   ),
    // );

    var screens = IntroScreens(
      onDone: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LoginChoice(),
        ),
      ),
      onSkip: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LoginChoice(),
        ),
      ),
      footerBgColor: TinyColor(Colors.purpleAccent).lighten().color,
      activeDotColor: Colors.white,
      footerRadius: 18.0,
//      indicatorType: IndicatorType.CIRCLE,
      slides: [
        IntroScreen(
          title: 'Search Pills',
          imageAsset: 'assets/images/onboard3.png',
          description: 'Know more about options for different contraceptive pills',
          headerBgColor: Colors.white,
        ),
        IntroScreen(
          title: 'Pill tracker',
          headerBgColor: Colors.white,
          imageAsset: 'assets/images/onboard2.png',
          description: "Track you medication cycle for any number of days",
        ),
        IntroScreen(
          title: 'FAQs',
          headerBgColor: Colors.white,
          imageAsset: 'assets/images/onboard1.png',
          description: "Educate yourself as well as ask any doubts from professional",
        ),
      ],
    );

    return Scaffold(
      body: screens,
    );
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
        context, MaterialPageRoute(builder: (context) => LoginChoice()));
    alertbox();
  }
}

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
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
            return OnBoardPage();
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