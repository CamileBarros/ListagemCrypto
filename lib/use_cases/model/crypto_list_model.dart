import 'package:flutter/cupertino.dart';
import 'package:listagem_crypto/use_cases/model/crypto_info_model.dart';

class CryptoListModel {
  AssetImage iconCrypto;
  String initialsCrypto;
  String nameCrypto;
  int investedCrypto;
  int dayVariation;
  DateTime purchaseDate;
  CryptoInfo cryptoInfo;

  CryptoListModel({
    required this.iconCrypto,
    required this.initialsCrypto,
    required this.nameCrypto,
    required this.investedCrypto,
    required this.dayVariation,
    required this.purchaseDate,
    required this.cryptoInfo,
  });
}
