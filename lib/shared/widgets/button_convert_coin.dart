import 'package:flutter/material.dart';
import 'package:listagem_crypto/shared/themes/app_colors.dart';

class ConvertCoinButton extends StatelessWidget {
  const ConvertCoinButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(25),
          child: TextButton(
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(AppColors.brandPrimary),
              ),
              onPressed: () {},
              child: const Text('Converter')),
        )
      ],
    );
  }
}
