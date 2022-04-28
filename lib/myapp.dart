import 'package:flutter/material.dart';
import 'screens/wallet/home_wallet.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeWalletPage(),
    );
  }
}
