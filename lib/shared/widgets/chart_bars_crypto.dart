import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listagem_crypto/shared/themes/app_colors.dart';
import 'package:listagem_crypto/shared/themes/app_text_style.dart';
import 'package:listagem_crypto/use_cases/model/crypto_list_model.dart';

class CryptoBarsChart extends StatelessWidget {
  final bool animate;
  final List<CryptoListModel> dataBars;

  const CryptoBarsChart(
      {Key? key, required this.dataBars, required this.animate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency();

    List<charts.Series<CryptoListModel, String>> series = [
      charts.Series(
          id: "charts",
          data: dataBars,
          domainFn: (CryptoListModel series, _) =>
              series.chartsCryptoList[0].period.toString(),
          measureFn: (CryptoListModel series, _) =>
              series.chartsCryptoList[0].marketCapt,
          colorFn: (_, __) =>
              charts.ColorUtil.fromDartColor(AppColors.linePrimary))
    ];

    return Container(
      height: 320,
      padding: const EdgeInsets.all(25),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: [
              Text(
                formatCurrency.format(dataBars[0].cryptoInfo.actualValueCrypto),
                style: TextStyles.titlePrimary,
              ),
              Expanded(child: charts.BarChart(series, animate: true))
            ],
          ),
        ),
      ),
    );
  }
}
