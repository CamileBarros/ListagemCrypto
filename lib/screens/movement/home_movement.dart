import 'package:flutter/material.dart';
import 'package:listagem_crypto/data_source/data_list_wallet.dart';
import 'package:listagem_crypto/shared/themes/app_colors.dart';
import 'package:listagem_crypto/shared/themes/app_images.dart';
import 'package:listagem_crypto/shared/themes/app_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:listagem_crypto/shared/widgets/screen_pages.dart';

class HomeMovement extends StatefulWidget {
  const HomeMovement({Key? key}) : super(key: key);

  @override
  State<HomeMovement> createState() => _HomeMovementState();
}

class _HomeMovementState extends State<HomeMovement> {
  final formatCurrency = NumberFormat.simpleCurrency();
  final formatDate = DateFormat('dd.MM.yy');

  @override
  Widget build(BuildContext context) {
    final containerDatas = DatasListWallet().containerDatas;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: ScreenPages(
            titles: AppLocalizations.of(context)!.nameMovement,
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...containerDatas.map((e) => Column(
                  children: [
                    Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: AppColors.primary))),
                        child: ListTile(
                            leading: const Icon(Icons.pie_chart),
                            title: Text(e.initialsCrypto),
                            subtitle: Text(
                              formatDate.format(e.purchaseDate),
                            ),
                            trailing: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      e.cryptoUnits.toString() +
                                          " " +
                                          e.initialsCrypto,
                                      style: TextStyles.initialsText,
                                    ),
                                    Text(formatCurrency.format(e.cryptoUnits *
                                        e.cryptoInfo.actualValueCrypto))
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const ImageIcon(
                                      AssetImage(AppImages.iconArrow)),
                                ),
                              ],
                            )))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
