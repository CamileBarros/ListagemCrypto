import 'package:flutter/material.dart';
import 'package:listagem_crypto/shared/widgets/screen_pages.dart';
import 'package:listagem_crypto/use_cases/model/title_screen_pages.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CurrencyConvertionPage extends StatelessWidget {
  const CurrencyConvertionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTitle = TitleScreen(AppLocalizations.of(context)!.nameBtnConvert);

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: ScreenPages(titles: textTitle)),
    );
  }
}
