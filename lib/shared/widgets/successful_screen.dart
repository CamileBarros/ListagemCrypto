import 'package:flutter/material.dart';
import 'package:listagem_crypto/shared/themes/app_colors.dart';
import 'package:listagem_crypto/shared/themes/app_images.dart';
import 'package:listagem_crypto/shared/themes/app_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SuccessfulScreen extends StatelessWidget {
  const SuccessfulScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(
            backgroundColor: AppColors.statusPos,
            child: Center(
              child: ImageIcon(AssetImage(AppImages.iconConfirmed)),
            ),
          ),
          Text(
            AppLocalizations.of(context)!.textPerfomed,
            style: TextStyles.titlePrimary,
          ),
          Text(
            AppLocalizations.of(context)!.textSuccesfully,
            style: TextStyles.titleText,
          )
        ],
      ),
    );
  }
}
