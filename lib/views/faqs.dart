import 'package:contra_care/views/faqs1.dart';
import 'package:contra_care/views/faqs2.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
        title: const Text('FAQs '),backgroundColor: Color(0xff7c83fd),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 1000),
        color: Color(0xff7c83fd),
        animationCurve: Curves.easeInOutQuad,
        height: 70,
        buttonBackgroundColor: Colors.blueGrey.shade100,
        items: <Widget>[
           Icon(Icons.medical_services_rounded),
          Icon(Icons.medication_rounded),
        ],
        onTap: _onItemTapped,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('FAQs'),backgroundColor: Colors.indigo[500]
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.medical_services_rounded),
//             label: 'daily use pill',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.medication_outlined),
//             label: 'e-pill',
//           ),
//           // BottomNavigationBarItem(
//           //   icon: Icon(Icons.school),
//           //   label: 'School',
//           // ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.indigo,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }