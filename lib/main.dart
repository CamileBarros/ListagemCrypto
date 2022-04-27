import 'package:flutter/material.dart';
import 'package:listagem_crypto/modules/pages/home/home_page.dart';

import 'modules/bottomNavBar/bottom_nav.dart';
import 'modules/pages/details/details_page.dart';
import 'modules/pages/wallet/home_wallet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/navBar',
      routes: {
        '/homeWallet': (BuildContext context) => const HomeWalletPage(),
        '/homepagge': (BuildContext context) => HomePage(),
        '/details': (BuildContext context) => HomeDetails(),
        '/navBar': (BuildContext context) => const BottomNavBar()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
