// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:contra_care/anonymous_login/anon_auth.dart';
// import 'package:contra_care/homepage.dart';
// import 'package:contra_care/login.dart';
// import 'package:contra_care/sign_up.dart';
//
//
// class Start extends StatefulWidget {
//   @override
//   _StartState createState() => _StartState();
// }
//
// class _StartState extends State<Start> {
//   final AuthService _auth = AuthService();
//
//   final List imgList = [
//     'images/onboard2.jpg',
//     'images/onboard1.jpg',
//     'images/onboard3.jpg',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         alignment: Alignment.center,
//         child: Column(
//           children: <Widget>[Padding(
//             padding: EdgeInsets.only(top: 200),
//           ),
//             Container(
//               child: CarouselSlider(
//                 options: CarouselOptions(height: 300,autoPlay: true),
//                 items: imgList
//                     .map((item) => Container(child: Image.asset(item)))
//                     .toList(),
//               ),
//             ),Padding(
//               padding: EdgeInsets.only(top: 20),
//             ),
//             RichText(
//                 textAlign: TextAlign.center,
//                 text: TextSpan(
//                     text: "Welcome to",
//                     style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black),
//                     children: <TextSpan>[
//                       TextSpan(
//                           text: ' Contracare',
//                           style: TextStyle(
//                               fontSize: 26,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.orange[700]))
//                     ])),
//             Padding(
//               padding: EdgeInsets.only(top: 10),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 RaisedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => Login()),
//                       );
//                     },
//                     //for connecting to basic login screen,in above path:  put Login() instead of LoginUI, LoginUI is the class created for designed UI
//                     child: Text(
//                       "Get started",
//                       style: TextStyle(fontSize: 22),
//                     ),
//                     color: Colors.orange[800],
//                     textColor: Colors.white),
//                 // SizedBox(width: 35.0),
//                 // RaisedButton(
//                 //     onPressed: () {
//                 //       Navigator.push(
//                 //         context,
//                 //         MaterialPageRoute(builder: (context) => SignUp()),
//                 //       );
//                 //     },
//                 //     child: Text(
//                 //       "REGISTER",
//                 //       style: TextStyle(fontSize: 22),
//                 //     ),
//                 //     color: Colors.orange[800],
//                 //     textColor: Colors.white),
//               ],
//             ),
//             RaisedButton(
//                 onPressed: () async {
//               dynamic result = await _auth.signInAnon();
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => HomePage()),);
//               if(result == null){
//                 print('error signing in');
//               } else {
//                 print('signed in');
//                 print(result);
//               }
//             },
//                 child: Text(
//               "sign in anonymously",
//               style: TextStyle(fontSize: 22),
//             ),
//                 color: Colors.orange[800],
//                 textColor: Colors.white),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'login.dart';

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
  int currentPage = 0;
  PageController _pageController =
  new PageController(initialPage: 0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('background-2.PNG'))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: PageView(
                  controller: _pageController,
                  children: [
                    onBoardPage("onboard1", "know about contraceptions"),
                    onBoardPage("onboard2", "check on medications"),
                    onBoardPage("onboard3", "track your monthly cycles"),
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
                  InkWell(
                    onTap: openLoginPage,
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.blueAccent.withOpacity(0.2),
                                offset: Offset(0, 9),
                                blurRadius: 30,
                                spreadRadius: 5)
                          ]),
                      child: Text(
                        "Get Started",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  /*Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )*/
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

  Column onBoardPage(String img, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('images/$img.jpg'))),
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  setCurrentPage(int value) {
    currentPage = value;
    setState(() {});
  }

  openLoginPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Login()));
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
