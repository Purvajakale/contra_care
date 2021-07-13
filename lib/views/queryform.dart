// import 'package:contra_care/services/validator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormFour extends StatefulWidget {
  @override
  _FormFourState createState() => _FormFourState();
}

class _FormFourState extends State<FormFour> with Validator {
  String id;
  final db = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final double minValue = 8.0;

  int experienceIndex = 0;

  final TextStyle _errorStyle = TextStyle(
    color: Colors.red,
    fontSize: 16.6,
  );

  @override
  void initState() {
    _onCreated();
    super.initState();
  }

  void _onCreated() async {
    await SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  void _onTapEmoji(int index) {
    setState(() {
      experienceIndex = index;
    });
  }

  String name, description,email;

  final Color activeColor = Colors.pink[400];
  final Color inActiveColor = Colors.grey[50];

  Widget _buildEmoji() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Material(
          color: Colors.transparent,
          child: IconButton(
            onPressed: () => _onTapEmoji(1),
            icon: Icon(
              Icons.sentiment_very_dissatisfied,
              color: experienceIndex == 1 ? activeColor : inActiveColor,
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: IconButton(
            onPressed: () => _onTapEmoji(2),
            icon: Icon(
              Icons.sentiment_dissatisfied,
              color: experienceIndex == 2 ? activeColor : inActiveColor,
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: IconButton(
            onPressed: () => _onTapEmoji(3),
            icon: Icon(
              Icons.sentiment_satisfied,
              color: experienceIndex == 3 ? activeColor : inActiveColor,
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: IconButton(
            onPressed: () => _onTapEmoji(4),
            icon: Icon(
              Icons.sentiment_very_satisfied,
              color: experienceIndex == 4 ? activeColor : inActiveColor,
            ),
          ),
        ),
      ],
    );
  }
    void createData() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      DocumentReference ref = await db
          .collection('query')
          .add({'name': name,'desc':description,'email':email});
      setState(() => id = ref.id);
      print(ref.id);
    }
  }

  Widget _buildName() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: minValue),
      child: TextFormField(
        controller: _nameController,
        validator: usernameValidator,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            errorStyle: _errorStyle,
            border: InputBorder.none,
            contentPadding:
                EdgeInsets.symmetric(vertical: minValue, horizontal: minValue),
            labelText: 'Full  Name',
            labelStyle: TextStyle(fontSize: 16.0, color: Colors.black87)),
        onSaved: (value) => name = value,
      ),
    );
  }

  Widget _buildEmail() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: minValue),
        child: TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.text,
          validator: validateEmail,
          onChanged: (String value) {},
          decoration: InputDecoration(
              errorStyle: _errorStyle,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                  vertical: minValue, horizontal: minValue),
              labelText: 'Email',
              labelStyle: TextStyle(fontSize: 16.0, color: Colors.black87)),
          onSaved: (value) => email = value,
        ));
  }

  Widget _buildDescription() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: minValue, vertical: minValue),
      child: TextFormField(
        controller: _messageController,
        keyboardType: TextInputType.text,
        maxLines: 2,
        decoration: InputDecoration(
            errorStyle: _errorStyle,
            border: InputBorder.none,
            labelText: 'Your query/doubts ',
            contentPadding: EdgeInsets.symmetric(horizontal: minValue),
            labelStyle: TextStyle(fontSize: 16.0, color: Colors.black87)),
            onSaved: (value) => description = value,
      ),
    );
  }

  Widget _buildTextBackground(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(2)),
      child: child,
    );
  }

  Widget _buildSubmitBtn() {
    return Container(
      width: 260,
      padding: EdgeInsets.symmetric(horizontal: minValue * 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient:
              LinearGradient(colors: [Colors.indigo[600], Colors.blue[200]])),
      child: RaisedButton(
        onPressed:createData,
        padding: EdgeInsets.symmetric(vertical: minValue * 2.4),
        elevation: 0.0,
        color: Colors.transparent,
        textColor: Colors.white,
        child: Text('SAVE'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ask your queries',style: TextStyle(fontSize: 18),),backgroundColor: Colors.indigo),
      body: Container(
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage('assets/images/feedback-four-bg.png'),
        //         fit: BoxFit.cover)),
        child: Container(
          //width: double.maxFinite,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
            Colors.black.withOpacity(0.8),
            Colors.black.withOpacity(0.7)
          ])),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only( left: 25.0, right: 25.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: minValue * 5,
                        ),
                        Text(
                          "Write Us",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 48.0,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 110.0,
                          child: Container(
                            height: 4,
                            color: Colors.pink[400],
                          ),
                        ),
                        SizedBox(
                          height: minValue * 2,
                        ),
                        Text(
                          "Feel free to write us. We will get back\n to you as soon as we can.",
                          style: TextStyle(
                              fontSize: 16.0, color: Colors.grey[200]),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: minValue * 5,
                        ),
                        Text(
                          "How was your experience?",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Form(
            key: _formKey,
            //child: Column(children:<Widget>[_buildName(),_buildEmail(),_buildDescription(),], ),
          child:Column(children: [SizedBox(
                          height: minValue,
                        ),
                        _buildEmoji(),
                        SizedBox(
                          height: minValue * 4,
                        ),
                        _buildTextBackground(_buildName()),
                        SizedBox(
                          height: minValue * 2,
                        ),
                        _buildTextBackground(_buildEmail()),
                        SizedBox(
                          height: minValue * 2,
                        ),
                        _buildTextBackground(_buildDescription()),
                        SizedBox(
                          height: minValue * 5,
                        ),
                        _buildSubmitBtn()],)
                        
                         ), ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Validator {
  static bool isEmail(String email) => EmailValidator.validate(email);

// Making Form Email Validation
  String validateEmail(String value) {
    bool isEmail(String email) => EmailValidator.validate(email);
    String msg = '';
    if (!isEmail(value.trim())) {
      msg = 'Please enter a valid email';
    } else {
      msg = null;
    }
    return msg;
  }

  String usernameValidator(String value) {
    if (value.isEmpty) {
      return 'Please enter a name';
    } else if (value.length < 4) {
      return 'Name must be 4';
    }
  }

  String mobileValidator(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
  }
}

class MyComponentsLoader extends StatelessWidget {
  final Color color;

  MyComponentsLoader({this.color});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}
