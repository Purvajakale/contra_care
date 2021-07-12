import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:neumorphic_container/neumorphic_container.dart';
// import 'package:neumorphic_container/neumorphic_container.dart';

class Table2 extends StatefulWidget {
  @override
  _Table2State createState() => _Table2State();
}

class _Table2State extends State<Table2> {
  @override
  Widget build(BuildContext context) {
    Color color = Color(0xfff0f0f0);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Test pills'),
      // ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('table2').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return Text('loading pills');
            return ListView.builder(
                itemCount: snapshot.data.size,
                itemBuilder: (context, index) {
                  return Container(
                    // child: ListTile(
                    //   title: Text(
                    //     snapshot.data.docs[index]['name'],
                    //     style: TextStyle(fontSize: 20),
                    //   ),
                    // ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: NeumorphicContainer(
                        height: 50,
                        width: 60,
                        borderRadius: 150,
                        depth: 20,
                        primaryColor: color,
                        borderColor: Colors.teal,
                        borderThickness: 1,
                        //flat neumorphism design
                        curvature: Curvature.flat,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 13),
                          child: Text(snapshot.data.docs[index]['name'],
                            style: TextStyle(fontSize: 20),),
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Table2 extends StatefulWidget {
//   @override
//   _Table2State createState() => _Table2State();
// }

// class _Table2State extends State<Table2> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Test pills'),
//       // ),
//       body: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance.collection('table2').snapshots(),
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
// }