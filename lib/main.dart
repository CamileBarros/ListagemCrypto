import 'package:flutter/material.dart';
import 'package:listagem_crypto/bottom_nav.dart';
import 'package:listagem_crypto/home_wallet_screen.dart';

import 'myapp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNav(),
      debugShowCheckedModeBanner: false,
    );
  }
}
