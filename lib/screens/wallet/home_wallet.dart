import 'package:flutter/material.dart';
import 'package:listagem_crypto/data_source/data_list_wallet.dart';
import 'package:listagem_crypto/screens/details/details_page.dart';
import 'package:listagem_crypto/shared/themes/app_colors.dart';
import 'package:listagem_crypto/shared/themes/app_text_style.dart';

class HomeWalletPage extends StatefulWidget {
  const HomeWalletPage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeWalletPage> createState() => _HomeWalletPageState();
}

class _HomeWalletPageState extends State<HomeWalletPage> {
  final containerDatas = ListDatasWallet().containerDatas;

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
                                leading: const ImageIcon(
                                    AssetImage("assets/images/bitcoin.png")),
                                title: Text(e.initialsCrypto),
                                subtitle: Text(e.nameCrypto),
                                trailing: AnimatedOpacity(
                                    opacity: show ? 1 : 0,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                    child: Column(
                                      children: [
                                        Text(e.investedAmount.toString()),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: e.dayVariation > 0
                                                  ? Colors.lightGreen
                                                  : Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child:
                                              Text(e.dayVariation.toString()),
                                        )
                                      ],
                                    )),
                                onTap: () => Navigator.pushNamed(
                                    context, '/details',
                                    arguments: ListDatasWallet()))),
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
