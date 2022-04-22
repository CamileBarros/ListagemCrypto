import 'package:flutter/material.dart';
import 'package:listagem_crypto/modules/details/details_page.dart';
import 'package:listagem_crypto/modules/home/home_page.dart';
import 'package:listagem_crypto/modules/navigation/bottom_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/navigation',
      routes: {
        '/home': (BuildContext context) => const HomeWalletScreen(),
        '/details': (BuildContext context) => const HomeDetails(),
        '/navigation': (BuildContext context) => const BottomNav()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
