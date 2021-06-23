import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:contra_care/animations/animation.dart';
import 'package:contra_care/login.dart';

class ResetScreen extends StatefulWidget{
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 400,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: -40,
                      height: 400,
                      width: width,
                      child: FadeAnimation(
                          1,
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/background-2.png'),
                                    fit: BoxFit.fill)),
                          )),
                    ),
                    Positioned(
                      height: 400,
                      width: width + 20,
                      child: FadeAnimation(
                          1.3,
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/background.png'),
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
                      child: Column(
                        children: <Widget>[
                          FadeAnimation(
                            1.5,
                            Text(
                              "Reset Password",
                              style: TextStyle(
                                  color: Color.fromRGBO(49, 39, 79, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),),

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
                                    color: Color.fromRGBO(196, 135, 198, .3),
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
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "email",
                                          hintStyle:
                                          TextStyle(color: Colors.grey)),
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (value) {
                                        setState(() {
                                          _email = value.trim();
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),

                          FadeAnimation( 1.9,
                            Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 60),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color.fromRGBO(49, 39, 79, 1),
                              ),
                              child: Center(
                                child: TextButton(
                                  child: Text(
                                    "Send Request",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    if(_email != null){
                                      auth.sendPasswordResetEmail(email: _email);
                                      Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) => Login(),
                                        ),
                                      );
                                    }
                                   else{
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          title: Text('ERROR'),
                                          content: Text('enter email'),
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
                                  },
                                ),
                              ),
                            ),
                          ),
                          FadeAnimation(2,
                            Center(
                              child: TextButton(
                                child: Text("Back to login page",
                                    style: TextStyle(
                                        color: Color.fromRGBO(49, 39, 79, .6))),
                                onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => Login()),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     RaisedButton(
              //       child: Text('Send Request'),
              //       onPressed: () {
              //         auth.sendPasswordResetEmail(email: _email);
              //         Navigator.of(context).pop();
              //       },
              //       color: Theme.of(context).accentColor,
              //     ),
              //
              //   ],
              // ),

            ],
          ),
        ),
      ),
    );
  }
}
