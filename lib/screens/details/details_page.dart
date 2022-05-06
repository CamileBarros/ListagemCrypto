import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listagem_crypto/data_source/data_list_wallet.dart';
import 'package:listagem_crypto/shared/themes/app_colors.dart';
import 'package:listagem_crypto/shared/themes/app_text_style.dart';
import 'package:listagem_crypto/shared/widgets/chart_bars_crypto.dart';
import 'package:listagem_crypto/shared/widgets/chart_line_crypto.dart';

class HomeDetails extends StatefulWidget {
  final String name;
  final String initials;
  final int invested;
  final int variation;
  final int min;
  final int max;
  final int capMarket;
  final int actualCrypto;
  final int datePeriod;

  const HomeDetails(
      {Key? key,
      required this.name,
      required this.initials,
      required this.invested,
      required this.variation,
      required this.min,
      required this.max,
      required this.capMarket,
      required this.actualCrypto,
      required this.datePeriod})
      : super(key: key);

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  final formatCurrency = NumberFormat.simpleCurrency();
  final containerDatas = DatasListWallet().containerDatas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(containerDatas[0].appModel.nameDetails),
        backgroundColor: AppColors.primary,
        titleTextStyle: TextStyles.titleText,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              widget.name,
              style: TextStyles.titlePrimary,
            ),
            Center(
                child: CryptoLineChart(
              dataLine: containerDatas,
              animate: false,
            )),
            Text(containerDatas[0].appModel.nameInfo,
                style: TextStyles.titleText),
            ListTile(
                title: Text(widget.name),
                subtitle: Text(containerDatas[0].appModel.nameActualValue),
                trailing: Text(formatCurrency.format(widget.actualCrypto))),
            Column(
              children: [
                Container(
                  child: ListTile(
                    title: Text(containerDatas[0].appModel.nameMarketCap),
                    trailing: SizedBox(
                      width: 53,
                      height: 20,
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: widget.capMarket > 0
                                  ? AppColors.statusPos
                                  : AppColors.statusNeg,
                              borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 12, top: 2, right: 12),
                            child: Text(widget.capMarket.toString() + "%"),
                          )),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(containerDatas[0].appModel.nameMinValue),
                  trailing: Text(formatCurrency.format(widget.min)),
                ),
                ListTile(
                  title: Text(containerDatas[0].appModel.nameMaxValue),
                  trailing: Text(formatCurrency.format(widget.max)),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 44,
                      width: 300,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: AppColors.brandPrimary,
                              onSurface: AppColors.statusNeg),
                          onPressed: () {},
                          child:
                              Text(containerDatas[0].appModel.nameBtnConvert)),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
