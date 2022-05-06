import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listagem_crypto/data_source/data_list_wallet.dart';
import 'package:listagem_crypto/shared/themes/app_colors.dart';
import 'package:listagem_crypto/shared/themes/app_text_style.dart';
import 'package:listagem_crypto/shared/widgets/chart_bars_crypto.dart';
import 'package:listagem_crypto/use_cases/model/crypto_list_model.dart';

class CryptoLineChart extends StatelessWidget {
  final bool animate;
  final List<CryptoListModel> dataLine;

  const CryptoLineChart(
      {Key? key, required this.dataLine, required this.animate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency();
    final containerDatas = DatasListWallet().containerDatas;

    List<charts.Series<CryptoListModel, num>> series = [
      charts.Series(
          id: "charts",
          data: dataLine,
          domainFn: (CryptoListModel series, _) =>
              series.chartsCryptoList.period,
          measureFn: (CryptoListModel series, _) =>
              series.chartsCryptoList.actualValueCrypto,
          colorFn: (_, __) =>
              charts.ColorUtil.fromDartColor(AppColors.linePrimary))
    ];

    return Container(
      height: 330,
      padding: const EdgeInsets.all(25),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: <Widget>[
              Text(
                formatCurrency
                    .format(dataLine[0].chartsCryptoList.actualValueCrypto),
                style: TextStyles.titlePrimary,
              ),
              Expanded(
                  child: charts.LineChart(
                series,
                animate: true,
                domainAxis: const charts.NumericAxisSpec(
                  tickProviderSpec:
                      charts.BasicNumericTickProviderSpec(zeroBound: false),
                  viewport: charts.NumericExtents(5, 20),
                ),
              )),
              Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => CryptoBarsChart(
                                    dataBars: containerDatas,
                                    animate: animate))));
                      },
                      icon: const Icon(Icons.bar_chart)))
            ],
          ),
        ),
      ),
    );
  }
}
