import 'package:flutter/material.dart';
import 'package:listagem_crypto/shared/model/charts_model.dart';
import 'package:listagem_crypto/shared/themes/app_colors.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:listagem_crypto/shared/widgets/crypto_chart.dart';

class HomeDetails extends StatefulWidget {
  HomeDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  final List<ChartsCryptoList> data = [
    ChartsCryptoList(
        actualValue: 3000,
        period: 5,
        barColor: charts.ColorUtil.fromDartColor(AppColors.linePrimary)),
    ChartsCryptoList(
        actualValue: 6000,
        period: 10,
        barColor: charts.ColorUtil.fromDartColor(AppColors.linePrimary)),
    ChartsCryptoList(
        actualValue: 5000,
        period: 15,
        barColor: charts.ColorUtil.fromDartColor(AppColors.linePrimary)),
    ChartsCryptoList(
        actualValue: 5000,
        period: 20,
        barColor: charts.ColorUtil.fromDartColor(AppColors.linePrimary)),
    ChartsCryptoList(
        actualValue: 4400,
        period: 30,
        barColor: charts.ColorUtil.fromDartColor(AppColors.linePrimary)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalhes')),
      body: Center(
          child: CryptoChart(
        data: data,
      )),
    );
  }
}
