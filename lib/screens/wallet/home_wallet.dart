import 'package:flutter/material.dart';
import 'package:listagem_crypto/data_source/data_list_wallet.dart';
import 'package:listagem_crypto/screens/details/details_page.dart';
import 'package:listagem_crypto/shared/themes/app_colors.dart';
import 'package:listagem_crypto/shared/themes/app_images.dart';
import 'package:listagem_crypto/shared/themes/app_text_style.dart';
import 'package:listagem_crypto/shared/widgets/button_convert_coin.dart';

class HomeWalletPage extends StatefulWidget {
  const HomeWalletPage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeWalletPage> createState() => _HomeWalletPageState();
}

class _HomeWalletPageState extends State<HomeWalletPage> {
  final containerDatas = DatasListWallet().containerDatas;

  bool show = true;

  @override
  Widget build(BuildContext context) {
    void _visibility(bool visibility) {
      setState(() => show = visibility);
    }

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: Container(
              height: 230,
              child: Center(
                  child: ListTile(
                title: Text(
                  "Carteira",
                  style: TextStyles.titlePrimary,
                ),
                subtitle: AnimatedOpacity(
                  opacity: show ? 1 : 0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: Text(
                    "R\$5000,00",
                    style: TextStyles.titlePrimary,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: AppColors.textPrimary,
                  ),
                  alignment: Alignment.topLeft,
                  onPressed: () => _visibility(!show),
                ),
              ))),
        ),
        body: Column(
          children: [
            ...containerDatas
                .map((e) => Column(
                      children: [
                        Container(
                            child: ListTile(
                                leading: Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(48),
                                      image: const DecorationImage(
                                          image:
                                              AssetImage(AppImages.iconBTC))),
                                ),
                                title: Text(e.initialsCrypto),
                                subtitle: Text(e.nameCrypto),
                                trailing: AnimatedOpacity(
                                    opacity: show ? 1 : 0,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                    child: Column(
                                      children: [
                                        Text(e.investedAmount.toString()),
                                        SizedBox(
                                          width: 53,
                                          height: 20,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                color: e.dayVariation > 0
                                                    ? AppColors.statusPos
                                                    : AppColors.statusNeg,
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            child:
                                                Text(e.dayVariation.toString()),
                                          ),
                                        )
                                      ],
                                    )),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeDetails(
                                                initials: e.initialsCrypto,
                                                name: e.nameCrypto,
                                                variation: e.dayVariation,
                                                invested: e.investedAmount,
                                                min: e.cryptoInfo.valueMin,
                                                max: e.cryptoInfo.valueMax,
                                                actualValue:
                                                    e.cryptoInfo.actualValue,
                                                capMarket:
                                                    e.cryptoInfo.marketCapt,
                                              )));
                                })),
                        const Divider(
                          height: 2,
                        )
                      ],
                    ))
                .toList()
          ],
        ));
  }
}
