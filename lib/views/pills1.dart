import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:neumorphic_container/neumorphic_container.dart';
import 'package:google_fonts/google_fonts.dart';

class Pills extends StatefulWidget {
  @override
  _PillsState createState() => _PillsState();
}

class _PillsState extends State<Pills> {
  @override
  Widget build(BuildContext context) {
    Color color = Color(0xfff0f0f0);
    return Scaffold(
      backgroundColor: color,
      // appBar: AppBar(
      //   title: Text('Test pills'),
      // ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.all(15).copyWith(left: 30, right: 20),
              child: Text(
                "Commonly available Brands of Emergency contraceptive pills in India",
                style: GoogleFonts.alikeAngular(
                    // fontStyle: FontStyle.italic,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
              ),
            ),
          ),
          SizedBox(height: 12),
          Expanded(
            child: Pillsinfo1(),
          ),
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Pills extends StatefulWidget {
//   @override
//   _PillsState createState() => _PillsState();
// }

// class _PillsState extends State<Pills> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Test pills'),
//       // ),
//       body: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance.collection('table1').snapshots(),
//           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (!snapshot.hasData) return Text('loading pills');
//             return ListView.builder(
//                 itemCount: snapshot.data.size,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     child: ListTile(
//                       title: Text(
//                         snapshot.data.docs[index]['name'],
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                   );
//                 });
//           }),
//     );
//   }
//

class Pillsinfo1 extends StatefulWidget {
  const Pillsinfo1({Key key}) : super(key: key);

  @override
  _Pillsinfo1State createState() => _Pillsinfo1State();
}

class _Pillsinfo1State extends State<Pillsinfo1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('table1').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return Text('loading pills');
            return ListView.builder(
                itemCount: snapshot.data.size,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: NeumorphicContainer(
                            height: 50,
                            width: 400,
                            borderRadius: 150,
                            depth: 20,
                            // primaryColor: color,
                            borderColor: Color(0xffB34180),
                            borderThickness: 1,
                            curvature: Curvature.flat,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, top: 13),
                              child: Text(snapshot.data.docs[index]['name'],
                                  // style: TextStyle(fontSize: 17),
                                  style: GoogleFonts.alikeAngular(
                                      // fontStyle: FontStyle.italic,
                                      fontSize: 17,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.grey[700])),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                });
          }),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:neumorphic_container/neumorphic_container.dart';

// class Pills extends StatefulWidget {
//   @override
//   _PillsState createState() => _PillsState();
// }

// class _PillsState extends State<Pills> {
//   @override
//   Widget build(BuildContext context) {
//     Color color = Color(0xfff0f0f0);
//     return Scaffold(
//       backgroundColor: color,
//       // appBar: AppBar(
//       //   title: Text('Test pills'),
//       // ),
//       body: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance.collection('table1').snapshots(),
//           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (!snapshot.hasData) return Text('loading pills');
//             return ListView.builder(
//                 itemCount: snapshot.data.size,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     // child: ListTile(
//                     //
//                     //   title: Text(
//                     //     snapshot.data.docs[index]['name'],
//                     //     style: TextStyle(fontSize: 20),
//                     //   ),
//                     // ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: NeumorphicContainer(
//                         height: 50,
//                         width: 60,
//                         borderRadius: 150,
//                         depth: 20,
//                         primaryColor: color,
//                         borderColor: Colors.indigo,
//                         borderThickness: 1,
//                         curvature: Curvature.flat,
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 20, top: 13),

//                           child: Text(snapshot.data.docs[index]['name'],
//                           style: TextStyle(fontSize: 17),),
//                         ),
//                       ),
//                     ),
//                   );
//                 });
//           }),
//     );
//   }
// }