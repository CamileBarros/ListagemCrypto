import 'package:flutter/material.dart';
import 'package:listagem_crypto/shared/model/crypto_list_model.dart';

class HomeDetails extends StatefulWidget {
  const HomeDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes')),
      body: Column(),
    );
  }
}
