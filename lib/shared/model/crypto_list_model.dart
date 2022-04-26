import 'package:flutter/src/widgets/basic.dart';

class CryptoListModel {
  String initialsCrypto;
  String nameCrypto;
  int investedAmount;
  int dayVariation;

  // CryptoListModel(this.initialsCrypto, this.nameCrypto, this.investedAmount,
  //     this.dayVariation);

  CryptoListModel(
      {required this.initialsCrypto,
      required this.nameCrypto,
      required this.investedAmount,
      required this.dayVariation});
}
