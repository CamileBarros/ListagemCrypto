import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:listagem_crypto/data_source/data_list_wallet.dart';
import 'package:listagem_crypto/data_source/data_period_filter.dart';
import 'package:listagem_crypto/shared/themes/app_colors.dart';
import 'package:listagem_crypto/shared/themes/app_text_style.dart';
import 'package:listagem_crypto/shared/widgets/chart_bars_crypto.dart';
import 'package:listagem_crypto/shared/widgets/chart_line_crypto.dart';
import 'package:listagem_crypto/use_cases/model/charts_model.dart';

class HomeDetails extends StatefulWidget {
  final String name;
  final String initials;
  final int invested;
  final int variation;
  final int min;
  final int max;
  final int actualCrypto;
  int logicOfBtn;

  HomeDetails(
      {Key? key,
      required this.name,
      required this.initials,
      required this.invested,
      required this.variation,
      required this.min,
      required this.max,
      required this.actualCrypto,
      required this.logicOfBtn})
      : super(key: key);

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  final formatCurrency = NumberFormat.simpleCurrency();
  final containerDatas = DatasListWallet().containerDatas;
  List<ChartsCryptoList> datasCharts = <ChartsCryptoList>[];

  bool show = false;
  bool click = false;
  int value = 15;
  num number = 0;

  @override
  initState() {
    super.initState();
    datasCharts = dateFilter(value);
  }

  List<ChartsCryptoList> dateFilter(num value) {
    final List<ChartsCryptoList> dataChart = [];
    num doubleInitial = 0;
    for (var i = 0; i < value; i++) {
      num doubleAdd = doubleInitial + i;
      num doubleAdd2 = doubleInitial + i / 2;

      final ChartsCryptoList chart =
          ChartsCryptoList(marketCapt: doubleAdd2, period: doubleAdd.toInt());
      dataChart.add(chart);
      number = value;
    }
    return dataChart;
  }

  @override
  Widget build(BuildContext context) {
    void _click(bool click) {
      setState(() => show = click);
    }

    void _clicked(bool clicked) {
      setState(() => click = clicked);
    }

    final periodDays = DataPeriodFilter().periodDays;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(AppLocalizations.of(context)!.nameDetails),
        backgroundColor: AppColors.primary,
        titleTextStyle: TextStyles.titleText,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                widget.name,
                style: TextStyles.titlePrimary,
              ),
            ),
            Center(
              child: show
                  ? CryptoBarsChart(
                      datasBars: datasCharts,
                      animate: false,
                      data: widget,
                    )
                  : CryptoLineChart(
                      dataLine: datasCharts, animate: false, data: widget),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, left: 25, bottom: 25),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 1),
                  child: Row(
                    children: [
                      ...periodDays.map((e) => Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: SizedBox(
                                  height: 42,
                                  width: 42,
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                          primary: AppColors.textPrimary,
                                          onSurface: Colors.blueGrey,
                                          backgroundColor:
                                              number == e.periodDays
                                                  ? Colors.white
                                                  : AppColors.primary),
                                      onPressed: () {
                                        setState(() {
                                          _clicked(!click);
                                          datasCharts =
                                              dateFilter(e.periodDays);
                                        });
                                      },
                                      child: Text(e.days)),
                                ),
                              ),
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: SizedBox(
                          height: 35,
                          width: 35,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                                onPressed: () => _click(!show),
                                icon: show
                                    ? const Icon(Icons.show_chart)
                                    : const Icon(Icons.bar_chart)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(AppLocalizations.of(context)!.nameInfo,
                style: TextStyles.titleText),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(height: 1, color: Colors.grey),
            ),
            ListTile(
                title: Text(widget.name),
                subtitle: Text(AppLocalizations.of(context)!.nameActualValue),
                trailing: Text(formatCurrency.format(widget.actualCrypto))),
            Column(
              children: [
                ListTile(
                  title: Text(AppLocalizations.of(context)!.nameMarketCap),
                  trailing: SizedBox(
                    width: 53,
                    height: 20,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: widget.variation > 0
                                ? AppColors.statusPos
                                : AppColors.statusNeg,
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12, top: 2, right: 12),
                          child: Text(widget.variation.toString() + "%"),
                        )),
                  ),
                ),
                ListTile(
                  title: Text(AppLocalizations.of(context)!.nameMinValue),
                  trailing: Text(formatCurrency.format(widget.min)),
                ),
                ListTile(
                  title: Text(AppLocalizations.of(context)!.nameMaxValue),
                  trailing: Text(formatCurrency.format(widget.max)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 44,
                        width: 300,
                        child: TextButton(
                            style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: AppColors.brandPrimary,
                                onSurface: AppColors.statusNeg),
                            onPressed: () {},
                            child: Text(
                                AppLocalizations.of(context)!.nameBtnConvert)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
