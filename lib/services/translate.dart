import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  GoogleTranslator translator = new GoogleTranslator();   //using google translator
  
   String out='';
  final lang=TextEditingController();
  String thing = 'hello friends welcome to world';   //getting text

  Future<String>trans(String lang)
 async {
    Translation translation = await translator.translate(lang, to: 'hi');       
    return await translation.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transalate !!"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[Padding(padding: EdgeInsets.all(30)),
          //     TextField(
          //       controller: lang,
          //     ),
              RaisedButton(
            color: Colors.red,
            child: Text("Press"),            //on press to translate the language using function
            onPressed: ()
            async {
              thing = await trans(thing);
            setState((){});
            },
          ),
          // Text(out.toString()) ,
          Text(thing), //translated string
            ],
          )
        ),
      ),
    );
  }
}