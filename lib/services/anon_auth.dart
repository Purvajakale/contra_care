import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthService {
  String id;
  final db = FirebaseFirestore.instance;
  String _name='anonymous login',_role='user';
  final _formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      createData();
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  void createData() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      DocumentReference ref = await db
          .collection('users')
          .add({'email':null,'role':_role,'name':_name});
      setState(() => id = ref.id);
    }
  }


}

void setState(String Function() param0) {
}