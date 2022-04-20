import 'package:flutter/material.dart';
import 'package:listagem_crypto/modules/details/details_page.dart';
import 'package:listagem_crypto/modules/home/home_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  BottomNavState createState() => BottomNavState();
}

class BottomNavState extends State<BottomNav> {
  int _actualPage = 0;
  void onTabTapped(int index) {
    setState(() {
      _actualPage = index;
    });
  }

  final List<Widget> _screens = [
    const HomeWalletScreen(),
    HomeDetails(),
    Container(
      color: Colors.blue,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_actualPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _actualPage,
        selectedItemColor: const Color.fromARGB(255, 255, 0, 106),
        onTap: onTabTapped,
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
      ),
    );
  }
// Selected
}
