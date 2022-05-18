import 'package:flutter/material.dart';
import 'package:listagem_crypto/data_source/data_button_percent.dart';
import 'package:listagem_crypto/shared/themes/app_colors.dart';
import 'package:listagem_crypto/shared/themes/app_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CurrencyConvertionPage extends StatelessWidget {
  const CurrencyConvertionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final percent = DataButtonPercent().percent;

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
                'Converter de: ',
                style: TextStyles.titleText,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Moeda',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Montante a ser convertido',
                ),
              ),
            ),
            Row(
              children: [
                ...percent.map((e) => Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: SizedBox(
                            height: 32,
                            width: 52,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(36)),
                              child: Container(
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                        primary: AppColors.textPrimary,
                                        onSurface: Colors.blueGrey),
                                    onPressed: () {},
                                    child: Text(e.percent + "%")),
                              ),
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
              child: Text(
                'Para receber em: ',
                style: TextStyles.titleText,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Moeda',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Montante a ser convertido',
                ),
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
                            child: Text('Cancelar'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CurrencyConvertionPage()));
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
                            child: Text('Confirmar'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CurrencyConvertionPage()));
                            },
                          ))
                    ],
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}
