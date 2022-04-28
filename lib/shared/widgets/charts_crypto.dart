import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:listagem_crypto/shared/themes/app_text_style.dart';
import 'package:listagem_crypto/use_cases/model/charts_model.dart';

class CryptoChart extends StatelessWidget {
  final List<ChartsCryptoList> data;

  const CryptoChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartsCryptoList, num>> series = [
      charts.Series(
          id: "charts",
          data: data,
          domainFn: (ChartsCryptoList series, _) => series.period,
          measureFn: (ChartsCryptoList series, _) => series.actualValue,
          colorFn: (ChartsCryptoList series, _) => series.barColor)
    ];

    return Container(
      height: 300,
      padding: EdgeInsets.all(25),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: <Widget>[
              Text(
                "R\$3000,00",
                style: TextStyles.titlePrimary,
              ),
              Expanded(
                child: charts.LineChart(series,
                    domainAxis: const charts.NumericAxisSpec(
                      tickProviderSpec:
                          charts.BasicNumericTickProviderSpec(zeroBound: false),
                      viewport: charts.NumericExtents(5, 20),
                    ),
                    animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}
