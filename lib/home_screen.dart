import 'package:flutter/material.dart';

import 'new_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomeScreen();
}

class HomeScreen extends State<HomePage> {
  int _actualPage = 0; //Actual Screen
  final List<Widget> screens = [
    NewPageScreen("Home"),
    NewPageScreen("Carteira"),
    NewPageScreen("Investimentos")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_actualPage], //List Position
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: 'Carteira',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet_giftcard),
            label: 'Movimentação',
          ),
        ],
        currentIndex: _actualPage,
        selectedItemColor: Color.fromARGB(255, 255, 0, 106),
        onTap: onTabTapped,
      ),
    );
  }

  int _selectedIndex = 0; // Selected

  void onTabTapped(int index) {
    setState(() {
      _actualPage = index;
    });
  }
}
