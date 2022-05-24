import 'package:flutter/material.dart';
import 'package:listagem_crypto/shared/themes/app_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PopUpError extends StatelessWidget {
  const PopUpError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text('Opa! Algum campo não foi preenchido...'),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(AppLocalizations.of(context)!.textCancel,
              style: TextStyles.linkText),
        ),
      ],
    );
  }
}
