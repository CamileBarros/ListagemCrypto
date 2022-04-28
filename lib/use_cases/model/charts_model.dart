import 'package:charts_flutter/flutter.dart' as charts;

class ChartsCryptoList {
  int actualValue;
  int period;
  charts.Color barColor;

  ChartsCryptoList(
      {required this.actualValue,
      required this.period,
      required this.barColor});
}
