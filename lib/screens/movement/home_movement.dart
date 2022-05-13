import 'package:flutter/material.dart';
import 'package:listagem_crypto/shared/themes/app_colors.dart';
import 'package:listagem_crypto/shared/themes/app_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeMovement extends StatefulWidget {
  const HomeMovement({Key? key}) : super(key: key);

  @override
  State<HomeMovement> createState() => _HomeMovementState();
}

class _HomeMovementState extends State<HomeMovement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Container(
                height: 200,
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 1, color: AppColors.primary))),
                child: Center(
                    child: ListTile(
                  title: Text(
                    AppLocalizations.of(context)!.nameMovement,
                    style: TextStyles.titlePrimary,
                  ),
                )))));
  }
}
