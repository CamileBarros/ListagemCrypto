import 'package:listagem_crypto/use_cases/model/crypto_info_model.dart';
import 'package:listagem_crypto/use_cases/model/crypto_list_model.dart';

class DatasListWallet {
  final List<CryptoListModel> containerDatas = [
    CryptoListModel(
      initialsCrypto: "BTC",
      nameCrypto: "BitCoin",
      investedAmount: 5000,
      dayVariation: 30,
      cryptoInfo:
          CryptoInfo(actualValue: 256, marketCapt: 2, valueMin: 2, valueMax: 4),
    ),
    CryptoListModel(
      initialsCrypto: "ETH",
      nameCrypto: "Etherum",
      investedAmount: 3000,
      dayVariation: 25,
      cryptoInfo:
          CryptoInfo(actualValue: 56, marketCapt: 3, valueMin: 5, valueMax: 6),
    ),
    CryptoListModel(
      initialsCrypto: "LTC",
      nameCrypto: "LiteCoin",
      investedAmount: 4000,
      dayVariation: 40,
      cryptoInfo:
          CryptoInfo(actualValue: 213, marketCapt: 4, valueMin: 3, valueMax: 5),
    ),
  ];
}
