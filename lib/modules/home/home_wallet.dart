import 'package:flutter/material.dart';
import 'package:listagem_crypto/shared/model/crypto_list_model.dart';

class HomeWalletPage extends StatefulWidget {
  const HomeWalletPage({Key? key}) : super(key: key);

  @override
  State<HomeWalletPage> createState() => _HomeWalletPageState();
}

class _HomeWalletPageState extends State<HomeWalletPage> {
  final List<CryptoListModel> containerDatas = [
    CryptoListModel("BTC", "BitCoin", 5000, 30),
    CryptoListModel("ETH", "Etherum", 5000, 40),
    CryptoListModel("LTC", "LiteCoin", 6000, 35),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ...containerDatas
            .map((e) => Container(
                  child: ListTile(
                    leading: ImageIcon(AssetImage("assets/images/bitcoin.png")),
                    title: Text(e.initialsCrypto),
                    subtitle: Text(e.nameCrypto),
                    trailing: Text(e.investedAmount.toString()),
                    onTap: () => Navigator.pushNamed(context, '/details'),
                  ),
                ))
            .toList()
      ]),
    );
  }
}
