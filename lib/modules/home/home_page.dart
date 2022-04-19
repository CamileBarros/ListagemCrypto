import 'package:flutter/material.dart';
import 'package:listagem_crypto/shared/model/crypto_list_model.dart';

class HomeWalletScreen extends StatefulWidget {
  const HomeWalletScreen({Key? key}) : super(key: key);

  @override
  State<HomeWalletScreen> createState() => _HomeWalletScreenState();
}

class _HomeWalletScreenState extends State<HomeWalletScreen> {
  final List<CryptoListModel> containerDatas = [
    CryptoListModel("BTC", "BitCoin", 500000, 35),
    CryptoListModel("ETH", "ETheryum", 50000, 40),
    CryptoListModel("LTC", "LiteCoin", 500000, 50),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: containerDatas.map((e) => Text(e.initialsCrypto)).toList()),
    );
  }
}
