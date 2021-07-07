import 'package:contra_care/views/faqs1.dart';
import 'package:contra_care/views/faqs2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FaqsPage extends StatefulWidget {
  const FaqsPage({Key key}) : super(key: key);

  @override
  State<FaqsPage> createState() => _FaqsPageState();
}

/// This is the private State class that goes with FaqsPage.
class _FaqsPageState extends State<FaqsPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
   final List<Widget> _widgetOptions = <Widget>[
     FaqPage1(),
     FaqPage2(),
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
        title: const Text('Pills Information'),
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