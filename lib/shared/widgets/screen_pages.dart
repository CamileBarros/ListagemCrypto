import 'package:flutter/material.dart';
import 'package:listagem_crypto/shared/themes/app_colors.dart';
import 'package:listagem_crypto/shared/themes/app_text_style.dart';
import 'package:listagem_crypto/use_cases/model/title_screen_pages.dart';

class ScreenPages extends StatelessWidget {
  final TitleScreen titles;
  const ScreenPages({Key? key, required this.titles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: AppColors.primary))),
        child: Center(
            child: ListTile(
          title: Text(
            titles.titleScreen,
            style: TextStyles.titlePrimary,
          ),
        )));
  }
}
