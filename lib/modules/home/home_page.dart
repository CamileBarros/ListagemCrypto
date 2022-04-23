import 'package:flutter/material.dart';
import 'package:listagem_crypto/shared/model/crypto_list_model.dart';

class HomeWalletScreen extends StatefulWidget {
  const HomeWalletScreen({Key? key}) : super(key: key);

  @override
  State<HomeWalletScreen> createState() => _HomeWalletScreenState();
}

bool show = true;

class _HomeWalletScreenState extends State<HomeWalletScreen> {
  final List<CryptoListModel> containerDatas = [
    CryptoListModel("BTC", "BitCoin", 5000, 30),
    CryptoListModel("ETH", "Etherum", 5000, 40),
    CryptoListModel("LTC", "LiteCoin", 6000, 35),
  ];

  @override
  Widget build(BuildContext context) {
    void _visibility(bool visibility) {
      setState(() => show = visibility);
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: Container(
          height: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Carteira",
                  style: Theme.of(context).textTheme.headline4,
                ),
                AnimatedOpacity(
                  opacity: show ? 1 : 0,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: Text(
                    "R\$ 2000,00",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.visibility),
                  alignment: Alignment.topLeft,
                  onPressed: () => _visibility(!show),
                ),
              ],
            ),
          ),
        ),
      ),
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
