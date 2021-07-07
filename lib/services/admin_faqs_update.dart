import 'package:contra_care/services/faq1update.dart';
import 'package:contra_care/services/faq2update.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FaqUpdate extends StatefulWidget {
  const FaqUpdate({Key key}) : super(key: key);

  @override
  State<FaqUpdate> createState() => _FaqUpdateState();
}

/// This is the private State class that goes with FaqUpdate.
class _FaqUpdateState extends State<FaqUpdate> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
   final List<Widget> _widgetOptions = <Widget>[
     Faq1Update(),
     Faq2Update(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ data'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'daily use pill',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'e-pill',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.school),
          //   label: 'School',
          // ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}