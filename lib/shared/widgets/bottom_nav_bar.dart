import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:listagem_crypto/screens/home/home_page.dart';
import 'package:listagem_crypto/screens/movement/home_movement.dart';
import 'package:listagem_crypto/screens/wallet/home_wallet.dart';
import 'package:listagem_crypto/shared/themes/app_colors.dart';
import 'package:listagem_crypto/shared/themes/app_images.dart';

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
              icon: const ImageIcon(AssetImage(AppImages.iconWarren)),
              label: AppLocalizations.of(context)!.nameHome),
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage(AppImages.iconWallet)),
            label: AppLocalizations.of(context)!.nameWallet,
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage(AppImages.iconMovement)),
            label: AppLocalizations.of(context)!.nameMovement,
          ),
        ],
      ),
    );
  }
// Selected
}
