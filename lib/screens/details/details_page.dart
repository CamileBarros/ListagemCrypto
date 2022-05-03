import 'package:flutter/material.dart';
import 'package:listagem_crypto/data_source/data_list_wallet.dart';
import 'package:listagem_crypto/shared/themes/app_colors.dart';
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
  final containerDatas = DatasListWallet().containerDatas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name)),
      body: Column(
        children: [
          Text(
            'conta',
            style: TextStyles.titlePrimary,
          ),
          Center(
              child: CryptoChart(
            data: containerDatas,
            animate: false,
          )),
          Text('Informações', style: TextStyles.titleText),
          ListTile(
              title: Text(widget.name),
              subtitle: const Text('teste'),
              trailing: SizedBox(
                width: 53,
                height: 20,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: widget.capMarket > 0
                            ? AppColors.statusPos
                            : AppColors.statusNeg,
                        borderRadius: BorderRadius.circular(16)),
                    child: Text(widget.capMarket.toString())),
              )),
          Column(
            children: [
              Container(
                child: ListTile(
                  title: const Text('Cap de mercado'),
                  trailing: Text(widget.variation.toString()),
                ),
              ),
              ListTile(
                title: const Text('Valor Mínimo'),
                trailing: Text(widget.min.toString()),
              ),
              ListTile(
                title: const Text('Valor Maximo'),
                trailing: Text(widget.max.toString()),
              ),
              Column(
                children: <Widget>[
                  Container(
                    child: SizedBox(
                      height: 44,
                      width: 357,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: AppColors.brandPrimary,
                              onSurface: AppColors.statusNeg),
                          onPressed: () {},
                          child: const Text('Converter')),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
