import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  Future alertboxmail() async {
    await showDialog(
      builder: (ctx) => AlertDialog(
        title: Text('Email-ID'),
        content: Text('contracreofficial@gmail.com'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text('OK'),
          )
        ],
      ),
      context: context,
    );
  }

  Future alertboxphone() async {
    await showDialog(
      builder: (ctx) => AlertDialog(
        title: Text('Phone number'),
        content: Text('91-38927 48943'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text('OK'),
          )
        ],
      ),
      context: context,
    );
  }

  Future alertboxcall() async {
    await showDialog(
      builder: (ctx) => AlertDialog(
        title: Text('Skype-ID'),
        content: Text('Lorem ipsum'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text('OK'),
          )
        ],
      ),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset("assets/images/doctor_pic2.png", height: 200),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 200,
                    height: 220,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Contracare",
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          "by Dr. ABCDEFG",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Row(
                          children: <Widget>[
                            InkWell(
                              onTap: alertboxmail,
                              child: IconTile(
                                backColor: Color(0xffFFECDD),
                                imgAssetPath: "assets/images/email.png",
                              ),
                            ),
                            InkWell(
                              onTap: alertboxphone,
                              child: IconTile(
                                backColor: Color(0xffFEF2F0),
                                imgAssetPath: "assets/images/call.png",
                              ),
                            ),
                            InkWell(
                              onTap: alertboxcall,
                              child: IconTile(
                                backColor: Color(0xffEBECEF),
                                imgAssetPath: "assets/images/video_call.png",
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 26,
              ),
              Text(
                "About",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Dr. Stefeni Albert is a cardiologist in Nashville & affiliated with multiple hospitals in the  area.He received his medical degree from Duke University School of Medicine and has been in practice for more than 20 years. ",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset("assets/images/mappin.png"),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Address",
                                style: TextStyle(
                                    color: Colors.black87.withOpacity(0.7),
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width - 268,
                                  child: Text(
                                    "House # 2, Road # 5, Green Road Dhanmondi, Dhaka, Bangladesh",
                                    style: TextStyle(color: Colors.grey),
                                  ))
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset("assets/images/clock.png"),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Daily Practict",
                                style: TextStyle(
                                    color: Colors.black87.withOpacity(0.7),
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width - 268,
                                  child: Text(
                                    '''Monday - Friday
Open till 7 Pm''',
                                    style: TextStyle(color: Colors.grey),
                                  ))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Image.asset(
                    "assets/images/map.png",
                    width: 120,
                  )
                ],
              ),
              // Text(
              //   "Activity",
              //   style: TextStyle(
              //       color: Color(0xff242424),
              //       fontSize: 28,
              //       fontWeight: FontWeight.w600),
              // ),
              SizedBox(
                height: 22,
              ),
              // Row(
              //   children: <Widget>[
              //     Expanded(
              //       child: Container(
              //         padding: EdgeInsets.symmetric(vertical: 24,horizontal: 16),
              //         decoration: BoxDecoration(
              //             color: Color(0xffFBB97C),
              //             borderRadius: BorderRadius.circular(20)),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: <Widget>[
              //             Container(
              //                 padding: EdgeInsets.all(8),
              //                 decoration: BoxDecoration(
              //                     color: Color(0xffFCCA9B),
              //                     borderRadius: BorderRadius.circular(16)
              //                 ),
              //                 child: Image.asset("assets/images/list.png")),
              //             SizedBox(
              //               width: 16,
              //             ),
              //             Container(
              //               width: MediaQuery.of(context).size.width/2 - 130,
              //               child: Text(
              //                 "List Of Schedule",
              //                 style: TextStyle(color: Colors.white,
              //                     fontSize: 15),
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //     SizedBox(width: 15,),
              //     Expanded(
              //       child: Container(
              //         padding: EdgeInsets.symmetric(vertical: 24,horizontal: 16),
              //         decoration: BoxDecoration(
              //             color: Color(0xffA5A5A5),
              //             borderRadius: BorderRadius.circular(20)),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: <Widget>[
              //             Container(
              //                 // padding: EdgeInsets.all(8),
              //                 decoration: BoxDecoration(
              //                     color: Color(0xffBBBBBB),
              //                     borderRadius: BorderRadius.circular(16)
              //                 ),
              //                 child: Image.asset("assets/images/list.png")),
              //             SizedBox(
              //               width: 16,
              //             ),
              //             Container(
              //               width: MediaQuery.of(context).size.width/2 - 130,
              //               child: Text(
              //                 "Doctor's Daily Post",
              //                 style: TextStyle(color: Colors.white,
              //                     fontSize: 15),
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class IconTile extends StatelessWidget {
  final String imgAssetPath;
  final Color backColor;

  IconTile({this.imgAssetPath, this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: backColor, borderRadius: BorderRadius.circular(15)),
        child: Image.asset(
          imgAssetPath,
          width: 20,
        ),
      ),
    );
  }
}
