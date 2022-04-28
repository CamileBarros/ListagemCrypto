import 'package:listagem_crypto/use_cases/model/crypto_list_model.dart';

class ListDatasWallet {
  final List<CryptoListModel> containerDatas = [
    CryptoListModel(
      initialsCrypto: "BTC",
      nameCrypto: "BitCoin",
      investedAmount: 5000,
      dayVariation: 30,
    ),
    CryptoListModel(
        initialsCrypto: "ETC",
        nameCrypto: "Etherum",
        investedAmount: 5000,
        dayVariation: -50),
    CryptoListModel(
        initialsCrypto: "LTC",
        nameCrypto: "LiteCoin",
        investedAmount: 3000,
        dayVariation: 40)
  ];
}
