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

  bool show = true;

  @override
  Widget build(BuildContext context) {
    void _visibility(bool visibility) {
      setState(() => show = visibility);
    }

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: Container(
              height: 230,
              child: Center(
                  child: ListTile(
                title: Text(
                  "Carteira",
                  style: Theme.of(context).textTheme.headline4,
                ),
                subtitle: AnimatedOpacity(
                  opacity: show ? 1 : 0,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: Text(
                    "R\$5000,00",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.visibility),
                  alignment: Alignment.topLeft,
                  onPressed: () => _visibility(!show),
                ),
              ))),
        ),
        body: Column(
          children: [
            ...containerDatas
                .map((e) => Column(
                      children: [
                        Container(
                          child: ListTile(
                            leading: ImageIcon(
                                AssetImage("assets/images/bitcoin.png")),
                            title: Text(e.initialsCrypto),
                            subtitle: Text(e.nameCrypto),
                            trailing: AnimatedOpacity(
                                opacity: show ? 1 : 0,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Text(e.investedAmount.toString()),
                                    ),
                                    Expanded(
                                        child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.lightGreen,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text('30\%'),
                                    ))
                                  ],
                                )),
                            onTap: () =>
                                Navigator.pushNamed(context, '/details'),
                          ),
                        ),
                        Divider(
                          height: 2,
                        )
                      ],
                    ))
                .toList()
          ],
        ));
  }
}
