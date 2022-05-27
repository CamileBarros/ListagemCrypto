import 'package:flutter/material.dart';
import 'package:listagem_crypto/shared/themes/app_colors.dart';
import 'package:listagem_crypto/shared/themes/app_text_style.dart';

class ScreenPages extends StatelessWidget {
  final String titles;
  const ScreenPages({Key? key, required this.titles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: AppColors.primary))),
        child: Center(
            child: ListTile(
          title: Text(
            titles,
            style: TextStyles.titlePrimary,
          ),
        )));
  }
}
