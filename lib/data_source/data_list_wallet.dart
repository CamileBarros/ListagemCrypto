import 'package:listagem_crypto/data_source/data_list_crypto.dart';
import 'package:listagem_crypto/use_cases/model/crypto_info_model.dart';
import 'package:listagem_crypto/use_cases/model/crypto_list_model.dart';

class ListDatasWallet {
  final crypto = DataListCrypto().crypto;
  final List<CryptoListModel> containerDatas = [
    CryptoListModel(
      initialsCrypto: "BTC",
      nameCrypto: "BitCoin",
      investedAmount: 5000,
      dayVariation: 30,
      cryptoInfo: CryptoInfo(
          actualValue: 213, marketCapt: 123, valueMin: 123, valueMax: 123),
    ),
  ];
}
