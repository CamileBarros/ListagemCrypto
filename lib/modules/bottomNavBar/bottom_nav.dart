import 'package:flutter/material.dart';
import 'package:listagem_crypto/modules/pages/home/home_page.dart';
import 'package:listagem_crypto/modules/pages/wallet/home_wallet.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int currentPage = 0;

  void onTabTapped(int index) {
    setState(() {
      currentPage = index;
    });
  }

  final List<Widget> pages = [
    const HomePage(),
    HomeWalletPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
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
