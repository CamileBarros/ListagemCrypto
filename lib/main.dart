import 'package:flutter/material.dart';
import 'package:listagem_crypto/modules/details/details_page.dart';
import 'package:listagem_crypto/modules/home/home_wallet.dart';
import 'package:listagem_crypto/modules/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/homeWallet': (BuildContext context) => const HomeWalletPage(),
        '/details': (BuildContext context) => const HomeDetails(),
        '/home': (BuildContext context) => const HomePage()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
