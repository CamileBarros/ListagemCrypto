import 'package:listagem_crypto/use_cases/model/period_filter_model.dart';

class DataPeriodFilter {
  final List<PeriodFilterList> periodDays = [
    PeriodFilterList(days: "5D", periodDays: 5),
    PeriodFilterList(days: "10D", periodDays: 10),
    PeriodFilterList(days: "15D", periodDays: 15),
    PeriodFilterList(days: "30D", periodDays: 30),
    PeriodFilterList(days: "50D", periodDays: 50)
  ];
}
