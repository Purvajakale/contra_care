import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contra_care/account_pages/resetpass.dart';
import 'package:contra_care/account_pages/signup1.dart';
import 'package:contra_care/views/adminpanel.dart';
import 'package:contra_care/views/home2.dart';
import 'package:contra_care/views/onboarding%20screen/onboard_main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:contra_care/views/homepage.dart';
import 'package:contra_care/account_pages/pass_reset.dart';
import 'package:contra_care/services/animation.dart';
import 'package:contra_care/account_pages/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../account_pages/login.dart';
import 'package:contra_care/services/anon_auth.dart';
import 'package:contra_care/features/reminders/screens/home/home.dart';


// class Onboarding extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(),
//       home: HomeController(),
//     );
//   }
// }


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}


class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name, _email, _password, _role = 'admin';

  checkAuth() async {
    _auth.authStateChanges().listen((user) {
      if (user != null && _email == 'contracareofficial@gmail.com') {
        print(user);
        _auth.currentUser.updateProfile(displayName: _name);
        Navigator.pushReplacementNamed(context, "adminpanel");
      } else if (user != null) {
        print(user);
        _auth.currentUser.updateProfile(displayName: _name);
        Navigator.pushReplacementNamed(context, "home");
      }
    });

  }


 

  login() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (_email == 'contracareofficial@gmail.com') {
        try {
          UserCredential user = await _auth.signInWithEmailAndPassword(
              email: _email, password: _password);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdminPanel()),
          );
        } catch (e) {
          showError(e.message);
          print(e);
        }
      } else
        // if(_role=='admin'&& _email=='contracareofficial@gmail.com'){checkrole();}

        try {
          UserCredential user = await _auth.signInWithEmailAndPassword(
              email: _email, password: _password);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } catch (e) {
          showError(e.message);
          print(e);
        }
    }alertbox();
  }

  showError(String errormessage) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('ERROR'),
        content: Text(errormessage),
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

   @override
  void initState() {
    super.initState();
    this.checkAuth();
    //this.checkrole();
  }


  @override
  Widget build(BuildContext context) {
    

    final width = MediaQuery.of(context).size.width;

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xffEB6383),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.55,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: login,
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white,),
        ),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 300,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: -40,
                        height: 350,
                        width: width,
                        child: FadeAnimation(
                            1,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/background-2.png'),
                                      fit: BoxFit.fill)),
                            )),
                      ),
                      Positioned(
                        height: 350,
                        width: width + 20,
                        child: FadeAnimation(
                            1.3,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/background.png'),
                                      fit: BoxFit.fill)),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              FadeAnimation(
                                1.5,
                                Text(
                                  "Login",
                                  style: GoogleFonts.quicksand(
                                      color: Color.fromRGBO(49, 39, 79, 1),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              FadeAnimation(
                                1.7,
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromRGBO(196, 135, 198, .3),
                                        blurRadius: 20,
                                        offset: Offset(0, 10),
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[200]))),
                                        child: TextFormField(
                                            validator: (input) {
                                              if (input.isEmpty)
                                                return 'Enter Email';
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                                enabledBorder: const OutlineInputBorder(
                                                  borderSide: const BorderSide(color: Color(0xffEB6383), width: 0.7),
                                                ),
                                                border: const OutlineInputBorder(),
                                                hintText: "email",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[600])),
                                            onSaved: (input) => _email = input),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[200]))),
                                        child: TextFormField(
                                            obscureText: true,
                                            validator: (input) {
                                              if (input.length < 6)
                                                return 'Provide Minimum 6 Character';
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                                enabledBorder: const OutlineInputBorder(
                                                  borderSide: const BorderSide(color: Color(0xffEB6383), width: 0.7),
                                                ),
                                                border: const OutlineInputBorder(),
                                                hintText: "password",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[600])),
                                            onSaved: (input) =>
                                                _password = input),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              FadeAnimation(
                                1.7,
                                Center(
                                  child: TextButton(
                                    child: Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                          color: Color(0xffEB6383).withOpacity(0.7),
                                      ),
                                    ),
                                    onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => ResetScreen()),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              FadeAnimation(1.9, loginButton),
                              FadeAnimation(
                                2,
                                Center(
                                  child: TextButton(
                                    child: Text(
                                      "Create Account",
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                    onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => SignUp()),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                           
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
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

}

// class HomeController extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // final AuthService auth = Provider.of(context).auth;
//     return StreamBuilder<User>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.active) {
//           User user = snapshot.data;
//           if (user == null) {
//             return Onboarding();
//             // return Home();
//           } else {
//             return HomePage();
//           }
//           // return user ? Home() : SignUpView();
//         }
//         return CircularProgressIndicator();
//       },
//     );
//   }
// }