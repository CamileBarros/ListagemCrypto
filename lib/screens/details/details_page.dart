import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:listagem_crypto/data_source/data_list_wallet.dart';
import 'package:listagem_crypto/shared/themes/app_colors.dart';
import 'package:listagem_crypto/shared/themes/app_text_style.dart';
import 'package:listagem_crypto/shared/widgets/chart_bars_crypto.dart';
import 'package:listagem_crypto/shared/widgets/chart_line_crypto.dart';

class HomeDetails extends StatefulWidget {
  final String name;
  final String initials;
  final int invested;
  final int variation;
  final int min;
  final int max;
  final int capMarket;
  final int actualCrypto;
  final int datePeriod;
  final Widget btnPeriod;

  const HomeDetails(
      {Key? key,
      required this.name,
      required this.initials,
      required this.invested,
      required this.variation,
      required this.min,
      required this.max,
      required this.capMarket,
      required this.actualCrypto,
      required this.datePeriod,
      required this.btnPeriod})
      : super(key: key);

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  final formatCurrency = NumberFormat.simpleCurrency();
  final containerDatas = DatasListWallet().containerDatas;

  bool show = false;

  @override
  Widget build(BuildContext context) {
    void _click(bool click) {
      setState(() => show = click);
    }

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
                  ? CryptoBarsChart(dataBars: containerDatas, animate: false)
                  : CryptoLineChart(dataLine: containerDatas, animate: false),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 1, 20, 1),
              child: Row(
                children: [
                  widget.btnPeriod,
                  Padding(
                    padding: const EdgeInsets.only(left: 90),
                    child: SizedBox(
                      height: 35,
                      width: 35,
                      child: IconButton(
                          onPressed: () => _click(!show),
                          icon: show
                              ? const Icon(Icons.show_chart)
                              : const Icon(Icons.bar_chart)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(AppLocalizations.of(context)!.nameInfo,
                  style: TextStyles.titleText),
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
                            color: widget.capMarket > 0
                                ? AppColors.statusPos
                                : AppColors.statusNeg,
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12, top: 2, right: 12),
                          child: Text(widget.capMarket.toString() + "%"),
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
