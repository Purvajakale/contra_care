import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final translator = GoogleTranslator();
  //using google translator

  String out = '';
  final lang = TextEditingController(); //getting text

  trans(var giventext) {
    translator.translate(giventext, to: 'mr') //translating to hi = hindi
        .then((output) {
      setState(() {
        out = output
            .toString(); //placing the translated text to the String to be used
      });
      print(out);
    });
    return out;
  }

  UniqueKey keyTile;
  bool isExpanded = false;

  void expandTile() {
    setState(() {
      isExpanded = true;
      keyTile = UniqueKey();
    });
  }

  void shrinkTile() {
    setState(() {
      isExpanded = false;
      keyTile = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transalate"),
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('faqs1').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData)
                return Text('loading faqs');
              else {
                return Container(
                  padding: EdgeInsets.only(top: 15),
                  child: ListView.builder(
                      itemCount: snapshot.data.size,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              shadowColor: Colors.greenAccent[400],
                              elevation: 5,
                              child: ExpansionTile(
                                key: keyTile,
                                backgroundColor: Colors.transparent,
                                initiallyExpanded: isExpanded,
                                childrenPadding:
                                    EdgeInsets.all(18).copyWith(top: 0),
                                title: Text(
                                  trans(snapshot.data.docs[index]['ques']),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                children: [
                                  Text(
                                    trans(snapshot.data.docs[index]['ans']),
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          padding: EdgeInsets.only(bottom: 5),
                        );
                      }),
                );
              }
            }),
        // child: Center(
        //     child: Column(
        //   children: <Widget>[
        //     Text(
        //       trans('hello world welcome home'),
        //       style: TextStyle(fontSize: 25,color: Colors.green),
        //     ),
        //     //translated string
        //   ],
        // )),
      ),
    );
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////
// class App extends StatefulWidget {
//   @override
//   _AppState createState() => _AppState();
// }

// class _AppState extends State<App> {

//   GoogleTranslator translator = new GoogleTranslator();   //using google translator
  
//    String out='';
//   final lang=TextEditingController();
//   String thing = 'hello friends welcome to world';   //getting text

//   Future<String>trans(String lang)
//  async {
//     Translation translation = await translator.translate(lang, to: 'hi');       
//     return await translation.toString();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Transalate !!"),
//       ),
//       body: Container(
//         child: Center(
//           child: Column(
//             children: <Widget>[Padding(padding: EdgeInsets.all(30)),
//           //     TextField(
//           //       controller: lang,
//           //     ),
//               RaisedButton(
//             color: Colors.red,
//             child: Text("Press"),            //on press to translate the language using function
//             onPressed: ()
//             async {
//               thing = await trans(thing);
//             setState((){});
//             },
//           ),
//           // Text(out.toString()) ,
//           Text(thing), //translated string
//             ],
//           )
//         ),
//       ),
//     );
//   }
// }