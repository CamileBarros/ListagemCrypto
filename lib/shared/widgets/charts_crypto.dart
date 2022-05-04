import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listagem_crypto/data_source/data_list_wallet.dart';
import 'package:listagem_crypto/shared/themes/app_colors.dart';
import 'package:listagem_crypto/shared/themes/app_text_style.dart';
import 'package:listagem_crypto/use_cases/model/crypto_list_model.dart';

class CryptoChart extends StatelessWidget {
  final List<CryptoListModel> data;
  final bool animate;

  const CryptoChart({Key? key, required this.data, required this.animate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final containerDatas = DatasListWallet().containerDatas;

    final formatCurrency = NumberFormat.simpleCurrency();
    List<charts.Series<CryptoListModel, DateTime>> series = [
      charts.Series(
          id: "charts",
          data: data,
          domainFn: (CryptoListModel series, _) =>
              series.chartsCryptoList.period,
          measureFn: (CryptoListModel series, _) =>
              series.chartsCryptoList.actualValueCrypto,
          colorFn: (_, __) =>
              charts.ColorUtil.fromDartColor(AppColors.linePrimary))
    ];

    return Container(
      height: 300,
      padding: const EdgeInsets.all(25),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: <Widget>[
              Text(
                formatCurrency.format(
                    containerDatas[0].chartsCryptoList.actualValueCrypto),
                style: TextStyles.titlePrimary,
              ),
              Expanded(
                child: charts.TimeSeriesChart(
                  series,
                  animate: animate,
                  dateTimeFactory: const charts.LocalDateTimeFactory(),
                  domainAxis: const charts.DateTimeAxisSpec(
                    tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
                      day: charts.TimeFormatterSpec(
                          format: 'dd', transitionFormat: 'dd MM'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
