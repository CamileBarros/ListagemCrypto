import 'package:listagem_crypto/use_cases/model/charts_model.dart';
import 'package:listagem_crypto/use_cases/model/crypto_info_model.dart';
import 'package:listagem_crypto/use_cases/model/crypto_list_model.dart';

class DatasListWallet {
  final List<CryptoListModel> containerDatas = [
    CryptoListModel(
        initialsCrypto: "BTC",
        nameCrypto: "BitCoin",
        investedAmount: 5000,
        dayVariation: 30,
        nameButton: "Converter moeda",
        cryptoInfo: CryptoInfo(
            actualValue: 256, marketCapt: 2, valueMin: 2, valueMax: 4),
        chartsCryptoList:
            ChartsCryptoList(actualValue: 3000, period: DateTime(2020, 6, 4))),
    CryptoListModel(
        initialsCrypto: "ETH",
        nameCrypto: "Etherum",
        investedAmount: 3000,
        dayVariation: 25,
        nameButton: "Converter moeda",
        cryptoInfo: CryptoInfo(
            actualValue: 5600, marketCapt: 3, valueMin: 5, valueMax: 6),
        chartsCryptoList:
            ChartsCryptoList(actualValue: 4000, period: DateTime(2020, 8, 5))),
    CryptoListModel(
        initialsCrypto: "LTC",
        nameCrypto: "LiteCoin",
        investedAmount: 4000,
        dayVariation: 40,
        nameButton: "Converter moeda",
        cryptoInfo: CryptoInfo(
            actualValue: 213, marketCapt: 4, valueMin: 3, valueMax: 5),
        chartsCryptoList:
            ChartsCryptoList(actualValue: 3000, period: DateTime(2020, 10, 9))),
  ];
}
