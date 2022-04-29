import 'package:flutter/material.dart';
import 'package:listagem_crypto/data_source/data_bitcoin_charts.dart';
import 'package:listagem_crypto/data_source/data_list_wallet.dart';
import 'package:listagem_crypto/shared/themes/app_text_style.dart';
import 'package:listagem_crypto/shared/widgets/charts_crypto.dart';

class HomeDetails extends StatefulWidget {
  const HomeDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  final dataBTC = ListBitcoinCharts().dataBTC;
  final containerDatas = ListDatasWallet().containerDatas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Detalhes',
      )),
      body: Column(
        children: [
          Container(
            child: Text(
              'conta',
              style: TextStyles.titlePrimary,
            ),
          ),
          Container(
            child: Center(
                child: CryptoChart(
              data: dataBTC,
            )),
          ),
        ],
      ),
    );
  }
}
