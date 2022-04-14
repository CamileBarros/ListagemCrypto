import 'package:flutter/material.dart';

class HomeWalletScreen extends StatelessWidget {
  const HomeWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const <Widget>[
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Mapa'),
          ),
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Álbum'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Fone'),
          ),
        ],
      ),
    );
  }
}
