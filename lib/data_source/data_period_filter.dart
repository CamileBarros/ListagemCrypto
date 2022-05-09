import 'package:listagem_crypto/use_cases/model/period_filter_model.dart';

class DataPeriodFilter {
  final List<PeriodFilterList> periodDays = [
    PeriodFilterList(days: "5D"),
    PeriodFilterList(days: "10D"),
    PeriodFilterList(days: "15D"),
    PeriodFilterList(days: "30D"),
    PeriodFilterList(days: "50D")
  ];
}
