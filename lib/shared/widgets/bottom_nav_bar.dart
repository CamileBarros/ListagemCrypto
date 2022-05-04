import 'package:flutter/material.dart';
import 'package:listagem_crypto/data_source/data_list_wallet.dart';
import 'package:listagem_crypto/screens/home/home_page.dart';
import 'package:listagem_crypto/screens/movement/home_movement.dart';
import 'package:listagem_crypto/screens/wallet/home_wallet.dart';
import 'package:listagem_crypto/shared/themes/app_colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  final containerDatas = DatasListWallet().containerDatas;
  int currentPage = 0;

  void onTabTapped(int index) {
    setState(() {
      currentPage = index;
    });
  }

  final List<Widget> pages = [
    const HomePage(),
    const HomeWalletPage(),
    const HomeMovement()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        selectedItemColor: AppColors.brandPrimary,
        onTap: onTabTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: containerDatas[0].appModel.nameHome,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.card_travel),
            label: containerDatas[0].appModel.nameWallet,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.wallet_giftcard),
            label: containerDatas[0].appModel.nameMovement,
          ),
        ],
      ),
    );
  }
// Selected
}
