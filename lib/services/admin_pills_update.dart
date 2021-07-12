import 'package:contra_care/services/pills1_update.dart';
import 'package:contra_care/services/pills2_update.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PillInfoUpdate extends StatefulWidget {
  const PillInfoUpdate({Key key}) : super(key: key);

  @override
  State<PillInfoUpdate> createState() => _PillInfoUpdateState();
}

/// This is the private State class that goes with PillInfoUpdate.
class _PillInfoUpdateState extends State<PillInfoUpdate> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
   final List<Widget> _widgetOptions = <Widget>[
     Pills1Update(),
     Pills2Update(),
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
        title: const Text('Pills Update',),backgroundColor: Color(0xff7c83fd),
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
//         title: const Text('Pills data'),
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'i-pill',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.business),
//             label: 'e-pill',
//           ),
//           // BottomNavigationBarItem(
//           //   icon: Icon(Icons.school),
//           //   label: 'School',
//           // ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.amber[800],
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }