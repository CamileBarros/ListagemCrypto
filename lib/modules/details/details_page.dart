import 'package:flutter/material.dart';

class HomeDetails extends StatefulWidget {
  const HomeDetails({Key? key}) : super(key: key);

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

final name = ["teste", "teste", "teste"];

class _HomeDetailsState extends State<HomeDetails> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(
              height: 5,
            ),
        itemCount: name.length,
        itemBuilder: (context, index) {
          return Container(
              child: ListTile(
                  title: Text(name[index]),
                  leading: ImageIcon(AssetImage("assets/images/bitcoin.png")),
                  trailing: Text(name[index])));
        });
  }
}
