import 'package:contra_care/features/reminders/screens/add_new_medicine/add_new_medicine.dart';
import 'package:contra_care/views/adminpanel.dart';
import 'package:contra_care/views/brandsinfo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:contra_care/account_pages/login.dart';
import 'package:contra_care/account_pages/sign_up.dart';
import 'package:contra_care/views/onboarding.dart';
import 'package:contra_care/views/homepage.dart';
import 'package:contra_care/features/reminders/screens/home/home.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black.withOpacity(0.05),
      statusBarColor: Colors.black.withOpacity(0.05),
      statusBarIconBrightness: Brightness.dark
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Popins",
          primaryColor: Color.fromRGBO(7, 190, 200, 1),
          textTheme: TextTheme(
              headline1: ThemeData.light().textTheme.headline1.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 10,
                    fontFamily: "Popins",
                  ),
              headline5: ThemeData.light().textTheme.headline1.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 17.0,
                    fontFamily: "Popins",
                  ),
              headline3: ThemeData.light().textTheme.headline3.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    fontFamily: "Popins",
                  ))),
        
        //primarySwatch: Colors.orange,
      
      home: Onboarding(),
      debugShowCheckedModeBanner: false,
      routes: <String,WidgetBuilder>{
        "Login" : (BuildContext context)=>Login(),
        "SignUp":(BuildContext context)=>SignUp(),
        "start":(BuildContext context)=>Onboarding(),
        "home":(BuildContext context)=>HomePage(),
        "pills" : (BuildContext context)=>PillsBrands(),
        "adminpanel":(BuildContext context)=>AdminPanel(),
        "reminder":(BuildContext context)=>Home(),
        "/add_new_medicine":(BuildContext context)=>AddNewMedicine(),
      },
    );
  }
}