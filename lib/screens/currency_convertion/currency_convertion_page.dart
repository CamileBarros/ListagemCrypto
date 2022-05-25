import 'package:flutter/material.dart';
import 'package:listagem_crypto/data_source/data_button_percent.dart';
import 'package:listagem_crypto/data_source/data_list_wallet.dart';
import 'package:listagem_crypto/shared/widgets/pop_up_error.dart';
import 'package:listagem_crypto/shared/widgets/successful_screen.dart';
import 'package:listagem_crypto/shared/themes/app_colors.dart';
import 'package:listagem_crypto/shared/themes/app_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CurrencyConvertionPage extends StatefulWidget {
  const CurrencyConvertionPage({Key? key}) : super(key: key);

  @override
  State<CurrencyConvertionPage> createState() => _CurrencyConvertionPageState();
}

class _CurrencyConvertionPageState extends State<CurrencyConvertionPage> {
  String? selectedValue;
  bool click = false;
  bool select = false;

  final myControllerOne = TextEditingController();
  final myControllerTwo = TextEditingController();

  @override
  void dispose() {
    myControllerOne.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final percent = DataButtonPercent().percent;
    final containerDatas = DatasListWallet().containerDatas;

    void _clicked(bool clicked) {
      setState(() => click = clicked);
    }

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(AppLocalizations.of(context)!.nameBtnConvert),
          backgroundColor: AppColors.primary,
          titleTextStyle: TextStyles.titleText,
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
              child: Text(
                AppLocalizations.of(context)!.textConvert,
                style: TextStyles.titleText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: DropdownButtonFormField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
                hint: Text(
                  AppLocalizations.of(context)!.nameCurrency,
                ),
                items: containerDatas.map((e) {
                  return DropdownMenuItem(
                    child: Text(
                      e.nameCrypto,
                    ),
                    value: e.nameCrypto,
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextField(
                controller: myControllerOne,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: AppLocalizations.of(context)!.textValueConvert,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...percent.map((e) => Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: SizedBox(
                            height: 32,
                            width: 52,
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    side: const BorderSide(
                                        color: AppColors.textPrimary, width: 1),
                                    primary: AppColors.textPrimary,
                                    onSurface: Colors.blueGrey),
                                onPressed: () {
                                  setState(() {
                                    _clicked(!click);
                                    myControllerTwo.text =
                                        (num.tryParse(myControllerOne.text)! *
                                                (e.numPercent / 100))
                                            .toString();
                                  });
                                },
                                child: Text(e.percent + "%")),
                          ),
                        )
                      ],
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
              child: Text(
                AppLocalizations.of(context)!.textConvertion,
                style: TextStyles.titleText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: DropdownButtonFormField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
                hint: Text(
                  AppLocalizations.of(context)!.nameCurrency,
                ),
                items: containerDatas.map((e) {
                  return DropdownMenuItem(
                    child: Text(e.nameCrypto),
                    value: e.nameCrypto,
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextField(
                controller: myControllerTwo,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: AppLocalizations.of(context)!.textValueConverted,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                          height: 44,
                          width: 125,
                          child: TextButton(
                            style: TextButton.styleFrom(
                                primary: AppColors.brandPrimary,
                                backgroundColor: AppColors.primary,
                                onSurface: AppColors.statusNeg),
                            child:
                                Text(AppLocalizations.of(context)!.textCancel),
                            onPressed: () {
                              myControllerOne.text = "";
                              myControllerTwo.text = "";
                            },
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                          height: 44,
                          width: 125,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  primary: AppColors.primary,
                                  backgroundColor: AppColors.brandPrimary,
                                  onSurface: AppColors.statusNeg),
                              child: Text(
                                  AppLocalizations.of(context)!.textConfirm),
                              onPressed: () {
                                setState(() {
                                  click
                                      ? showModalBottomSheet(
                                          context: context,
                                          builder: (context) =>
                                              const SuccessfulScreen())
                                      : showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              const PopUpError());
                                  myControllerOne.text = "";
                                  myControllerTwo.text = "";
                                });
                              }))
                    ],
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}
