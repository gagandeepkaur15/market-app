import 'package:flutter/material.dart';
import 'package:goose_task/screens/profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:goose_task/screens/sell.dart';

class BNB extends StatefulWidget {
  const BNB({Key? key}) : super(key: key);

  @override
  State<BNB> createState() => _BNBState();
}

class _BNBState extends State<BNB> {
  var selectedItem = 0;
  List children = [
    const Profile(),
    const Sell(),
    const Profile(),
    const Profile(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   body: children[selectedItem],
        //   bottomNavigationBar:
        BottomNavigationBar(
      backgroundColor: const Color.fromARGB(255, 53, 56, 63),
      iconSize: 25,
      currentIndex: selectedItem,
      unselectedLabelStyle: const TextStyle(color: Colors.green),
      unselectedItemColor: Colors.white,
      selectedItemColor: const Color.fromARGB(225, 248, 86, 88),
      onTap: (currIndex) {
        setState(() {
          selectedItem = currIndex;
        });
      },
      items: const [
        BottomNavigationBarItem(
          backgroundColor: Color.fromARGB(255, 53, 56, 63),
          icon: Icon(Icons.home),
          label: 'Discover',
        ),
        BottomNavigationBarItem(
          backgroundColor: Color.fromARGB(255, 53, 56, 63),
          icon: Icon(Icons.sell),
          label: 'Items',
        ),
        BottomNavigationBarItem(
          backgroundColor: Color.fromARGB(255, 53, 56, 63),
          icon: Icon(Icons.add),
          label: ' ',
        ),
        BottomNavigationBarItem(
          backgroundColor: Color.fromARGB(255, 53, 56, 63),
          icon: FaIcon(FontAwesomeIcons.star),
          label: 'Services',
        ),
        BottomNavigationBarItem(
          backgroundColor: Color.fromARGB(255, 53, 56, 63),
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      // ),
    );
  }
}
