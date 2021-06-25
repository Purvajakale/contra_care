import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:contra_care/account_pages/login.dart';
import 'package:contra_care/account_pages/sign_up.dart';
import 'package:contra_care/account_pages/onboarding.dart';
import 'package:contra_care/views/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Onboarding(),
      debugShowCheckedModeBanner: false,
      routes: <String,WidgetBuilder>{
        "Login" : (BuildContext context)=>Login(),
        "SignUp":(BuildContext context)=>SignUp(),
        "start":(BuildContext context)=>Onboarding(),
        "home":(BuildContext context)=>HomePage(),
      },
    );
  }
}
