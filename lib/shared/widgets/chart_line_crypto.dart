import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listagem_crypto/screens/details/details_page.dart';
import 'package:listagem_crypto/shared/themes/app_colors.dart';
import 'package:listagem_crypto/shared/themes/app_text_style.dart';
import 'package:listagem_crypto/use_cases/model/charts_model.dart';

class CryptoLineChart extends StatelessWidget {
  final bool animate;
  final List<ChartsCryptoList> dataLine;
  final HomeDetails data;

  const CryptoLineChart(
      {Key? key,
      required this.dataLine,
      required this.animate,
      required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency();

    List<charts.Series<ChartsCryptoList, num>> series = [
      charts.Series(
          id: "charts",
          data: dataLine,
          domainFn: (ChartsCryptoList series, _) => series.period,
          measureFn: (ChartsCryptoList series, _) => series.marketCapt,
          colorFn: (_, __) =>
              charts.ColorUtil.fromDartColor(AppColors.linePrimary))
    ];
    return Container(
      height: 330,
      padding: const EdgeInsets.only(right: 25, left: 25, top: 25),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: <Widget>[
              Text(
                formatCurrency.format(data.actualCrypto),
                style: TextStyles.titlePrimary,
              ),
              Expanded(
                  child: charts.LineChart(
                series,
                animate: true,
                domainAxis: const charts.NumericAxisSpec(
                  tickProviderSpec:
                      charts.BasicNumericTickProviderSpec(zeroBound: false),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
