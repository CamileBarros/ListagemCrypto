import 'package:flutter/material.dart';
import 'package:listagem_crypto/shared/model/crypto_list_model.dart';

class HomeDetails extends StatefulWidget {
  const HomeDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

bool show = true;

final List<CryptoListModel> containerDatas = [
  CryptoListModel("BTC", "BitCoin", 5000, 30),
  CryptoListModel("ETH", "Etherum", 5000, 40),
  CryptoListModel("LTC", "LiteCoin", 6000, 35),
];

class _HomeDetailsState extends State<HomeDetails> {
  @override
  Widget build(BuildContext context) {
    void _visibility(bool visibility) {
      setState(() => show = visibility);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes')),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Text(
              'Carteira',
              style: Theme.of(context).textTheme.headline4,
            )),
            Expanded(
              child: AnimatedOpacity(
                opacity: show ? 1 : 0,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: Text(
                  "R\$ 2000,00",
                  style: Theme.of(context).textTheme.headline4,
                ),
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
    );
  }
}

      // Column(children: [
      //       ...containerDatas
      //           .map((e) => Container(
      //                 child: ListTile(
      //                   leading:
      //                       ImageIcon(AssetImage("assets/images/bitcoin.png")),
      //                   title: Text(e.initialsCrypto),
      //                   subtitle: Text(e.nameCrypto),
      //                   trailing: Text(e.investedAmount.toString()),
      //                   onTap: () => Navigator.pushNamed(context, '/details'),
      //                 ),
      //               ))
      //           .toList()
      //     ]),