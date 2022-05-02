import 'package:flutter/material.dart';
import 'package:listagem_crypto/data_source/data_bitcoin_charts.dart';
import 'package:listagem_crypto/data_source/data_list_wallet.dart';
import 'package:listagem_crypto/shared/themes/app_text_style.dart';
import 'package:listagem_crypto/shared/widgets/charts_crypto.dart';

class HomeDetails extends StatefulWidget {
  final String name;
  final String initials;
  final int invested;
  final int variation;
  final int min;
  final int max;
  final int capMarket;
  final int actualValue;

  const HomeDetails(
      {Key? key,
      required this.name,
      required this.initials,
      required this.invested,
      required this.variation,
      required this.min,
      required this.max,
      required this.capMarket,
      required this.actualValue})
      : super(key: key);

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  final dataBTC = ListBitcoinCharts().dataBTC;
  final containerDatas = DatasListWallet().containerDatas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name)),
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
          Container(
            child: Text('Informações', style: TextStyles.titleText),
          ),
          Container(
            child: ListTile(
              title: Text(widget.name),
              subtitle: Text('teste'),
              trailing: Container(
                  decoration: BoxDecoration(
                      color:
                          widget.capMarket > 0 ? Colors.lightGreen : Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(widget.capMarket.toString())),
            ),
          ),
          Column(
            children: [
              Container(
                child: ListTile(
                  title: Text('Cap de mercado'),
                  trailing: Text(widget.variation.toString()),
                ),
              ),
              Container(
                child: ListTile(
                  title: Text('Valor Mínimo'),
                  trailing: Text(widget.min.toString()),
                ),
              ),
              Container(
                child: ListTile(
                  title: Text('Valor Maximo'),
                  trailing: Text(widget.max.toString()),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
