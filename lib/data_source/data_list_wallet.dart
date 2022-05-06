import 'package:listagem_crypto/use_cases/model/app_model.dart';
import 'package:listagem_crypto/use_cases/model/charts_model.dart';
import 'package:listagem_crypto/use_cases/model/crypto_info_model.dart';
import 'package:listagem_crypto/use_cases/model/crypto_list_model.dart';

class DatasListWallet {
  final List<CryptoListModel> containerDatas = [
    CryptoListModel(
      initialsCrypto: "BTC",
      nameCrypto: "BitCoin",
      investedCrypto: 2000,
      dayVariation: 3,
      cryptoInfo: CryptoInfo(
          valueWallet: 5000, marketCapt: 2, valueMin: 2, valueMax: 4),
      appModel: AppModel(
          nameWallet: "Carteira",
          nameHome: "Home",
          nameMovement: "Movientação",
          nameInfo: "Informações",
          nameActualValue: "Valor atual",
          nameMarketCap: "Cap de mercado",
          nameMinValue: "Valor mínimo",
          nameMaxValue: "Valor máximo",
          nameBtnConvert: "Converter moeda",
          nameDetails: "Detalhes"),
      chartsCryptoList: ChartsCryptoList(actualValueCrypto: 4000, period: 5),
    ),
    CryptoListModel(
      initialsCrypto: "ETH",
      nameCrypto: "Etherum",
      investedCrypto: 3000,
      dayVariation: -05,
      cryptoInfo: CryptoInfo(
          valueWallet: 5000, marketCapt: 3, valueMin: 5, valueMax: 6),
      chartsCryptoList: ChartsCryptoList(actualValueCrypto: 4000, period: 9),
      appModel: AppModel(
          nameWallet: "Carteira",
          nameHome: "Home",
          nameMovement: "Movientação",
          nameInfo: "Informações",
          nameActualValue: "Valor atual",
          nameMarketCap: "Cap de mercado",
          nameMinValue: "Valor mínimo",
          nameMaxValue: "Valor máximo",
          nameBtnConvert: "Converter moeda",
          nameDetails: "Detalhes"),
    ),
    CryptoListModel(
      initialsCrypto: "LTC",
      nameCrypto: "LiteCoin",
      investedCrypto: 4000,
      dayVariation: 4,
      cryptoInfo: CryptoInfo(
          valueWallet: 5000, marketCapt: 4, valueMin: 3, valueMax: 5),
      chartsCryptoList: ChartsCryptoList(actualValueCrypto: 3000, period: 20),
      appModel: AppModel(
          nameWallet: "Carteira",
          nameHome: "Home",
          nameMovement: "Movientação",
          nameInfo: "Informações",
          nameActualValue: "Valor atual",
          nameMarketCap: "Cap de mercado",
          nameMinValue: "Valor mínimo",
          nameMaxValue: "Valor máximo",
          nameBtnConvert: "Converter moeda",
          nameDetails: "Detalhes"),
    ),
  ];
}
