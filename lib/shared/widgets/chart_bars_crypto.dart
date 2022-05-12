import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listagem_crypto/screens/details/details_page.dart';
import 'package:listagem_crypto/shared/themes/app_colors.dart';
import 'package:listagem_crypto/shared/themes/app_text_style.dart';
import 'package:listagem_crypto/use_cases/model/charts_model.dart';

class CryptoBarsChart extends StatelessWidget {
  final bool animate;
  final List<ChartsCryptoList> datasBars;
  final HomeDetails data;

  const CryptoBarsChart(
      {Key? key,
      required this.datasBars,
      required this.animate,
      required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency();

    List<charts.Series<ChartsCryptoList, String>> series = [
      charts.Series(
          id: "charts",
          data: datasBars,
          domainFn: (ChartsCryptoList series, _) => series.period.toString(),
          measureFn: (ChartsCryptoList series, _) => series.marketCapt,
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
                formatCurrency.format(data.actualCrypto),
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
