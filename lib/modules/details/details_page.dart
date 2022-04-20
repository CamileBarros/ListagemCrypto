import 'package:flutter/material.dart';

import '../../shared/model/crypto_list_model.dart';

class HomeDetails extends StatefulWidget {
  const HomeDetails({Key? key}) : super(key: key);

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

final List<CryptoListModel> containerDatas = [
  CryptoListModel("BTC", "BitCoin", 5000, 30),
  CryptoListModel("ETH", "Etherum", 5000, 40),
  CryptoListModel("LTC", "LiteCoin", 6000, 35),
];

class _HomeDetailsState extends State<HomeDetails> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(
              height: 5,
            ),
        itemCount: containerDatas.length,
        itemBuilder: (context, index) {
          return Container(
              child: ListTile(
                  title: Text(containerDatas[index].initialsCrypto),
                  subtitle: Text(containerDatas[index].nameCrypto),
                  leading: ImageIcon(AssetImage("assets/images/bitcoin.png")),
                  trailing: Text(containerDatas[index].initialsCrypto)));
        });
  }
}
