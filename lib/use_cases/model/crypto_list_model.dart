import 'package:listagem_crypto/use_cases/model/crypto_info_model.dart';

class CryptoListModel {
  String initialsCrypto;
  String nameCrypto;
  int investedAmount;
  int dayVariation;
  CryptoInfo cryptoInfo;

  CryptoListModel(
      {required this.initialsCrypto,
      required this.nameCrypto,
      required this.investedAmount,
      required this.dayVariation,
      required this.cryptoInfo});
}
