import 'package:flutter/material.dart';
import 'package:listagem_crypto/shared/model/crypto_list_model.dart';
import 'package:collection/collection.dart';

class HomeWalletScreen extends StatefulWidget {
  const HomeWalletScreen({Key? key}) : super(key: key);

  @override
  State<HomeWalletScreen> createState() => _HomeWalletScreenState();
}

class _HomeWalletScreenState extends State<HomeWalletScreen> {

  final iniciais = ["BTC", "BTC", "BTC"];
  final name = ["teste", "teste", "teste"];

  // final List<CryptoListModel> containerDatas = [
  //   CryptoListModel("BTC", "BitCoin", 5000, 30),
  //   CryptoListModel("ETH", "Etherum", 5000, 40),
  //   CryptoListModel("LTC", "LiteCoin", 6000, 35),
  // ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(
              height: 5,
            ),
        itemCount: iniciais.length,
        itemBuilder: (context, index) {
          return Container(
              child: ListTile(
                  onTap: (int [index]) {
                    

                  },
                  title: Text(iniciais[index]),
                  subtitle: Text(name[index]),
                  leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/bitcoin.png")),
                  trailing: Text(name[index])));
        });

    // return Scaffold(
    //   body: Column(
    //       children: containerDatas.map((e) => Text(e.initialsCrypto)).toList()),
    // );
  }
}
