import 'package:flutter/cupertino.dart';
import 'package:listagem_crypto/shared/themes/app_images.dart';
import 'package:listagem_crypto/use_cases/model/crypto_info_model.dart';
import 'package:listagem_crypto/use_cases/model/crypto_list_model.dart';

class DatasListWallet {
  final List<CryptoListModel> containerDatas = [
    CryptoListModel(
      iconCrypto: const AssetImage(AppImages.iconBTC),
      initialsCrypto: "BTC",
      nameCrypto: "BitCoin",
      investedCrypto: 2000,
      dayVariation: 3,
      cryptoInfo: CryptoInfo(
          valueWallet: 5000, actualValueCrypto: 2400, valueMin: 2, valueMax: 4),
    ),
    CryptoListModel(
      iconCrypto: const AssetImage(AppImages.iconETH),
      initialsCrypto: "ETH",
      nameCrypto: "Ethereum",
      investedCrypto: 3000,
      dayVariation: -05,
      cryptoInfo: CryptoInfo(
          valueWallet: 5000, actualValueCrypto: 4000, valueMin: 5, valueMax: 6),

      ///  [[1d][2d]]// 1d: lista, 2d: lista
    ),
    CryptoListModel(
      iconCrypto: const AssetImage(AppImages.iconLTC),
      initialsCrypto: "LTC",
      nameCrypto: "LiteCoin",
      investedCrypto: 4000,
      dayVariation: 4,
      cryptoInfo: CryptoInfo(
          valueWallet: 5000, actualValueCrypto: 3000, valueMin: 3, valueMax: 5),
    ),
  ];
}
