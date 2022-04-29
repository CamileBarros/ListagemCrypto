import 'package:listagem_crypto/shared/themes/app_colors.dart';
import 'package:listagem_crypto/use_cases/model/charts_model.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ListLitcoinCharts {
  final List<ChartsCryptoList> dataLTC = [
    ChartsCryptoList(
        actualValue: 2000,
        period: 5,
        barColor: charts.ColorUtil.fromDartColor(AppColors.linePrimary)),
    ChartsCryptoList(
        actualValue: 3000,
        period: 10,
        barColor: charts.ColorUtil.fromDartColor(AppColors.linePrimary)),
    ChartsCryptoList(
        actualValue: 5000,
        period: 15,
        barColor: charts.ColorUtil.fromDartColor(AppColors.linePrimary)),
    ChartsCryptoList(
        actualValue: 4000,
        period: 20,
        barColor: charts.ColorUtil.fromDartColor(AppColors.linePrimary)),
    ChartsCryptoList(
        actualValue: 4400,
        period: 30,
        barColor: charts.ColorUtil.fromDartColor(AppColors.linePrimary)),
  ];
}
