import 'package:listagem_crypto/use_cases/model/charts_model.dart';
import 'package:listagem_crypto/use_cases/model/crypto_info_model.dart';

class CryptoListModel {
  String initialsCrypto;
  String nameCrypto;
  int investedAmount;
  int dayVariation;
  String nameButton;
  CryptoInfo cryptoInfo;
  ChartsCryptoList chartsCryptoList;

  CryptoListModel(
      {required this.initialsCrypto,
      required this.nameCrypto,
      required this.investedAmount,
      required this.dayVariation,
      required this.nameButton,
      required this.cryptoInfo,
      required this.chartsCryptoList});
}
