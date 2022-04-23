import 'package:flutter/material.dart';
import 'package:listagem_crypto/modules/home/home_wallet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int currentPage = 0;

  void onTabTapped(int index) {
    setState(() {
      currentPage = index;
    });
  }

  final List<Widget> pages = [
    const HomeWalletPage(),
    Container(
      color: Colors.blue,
    )
  ];

  bool show = true;

  @override
  Widget build(BuildContext context) {
    void _visibility(bool visibility) {
      setState(() => show = visibility);
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: Container(
          height: 230,
          child: Center(
              child: ListTile(
            title: Text(
              "Carteira",
              style: Theme.of(context).textTheme.headline4,
            ),
            subtitle: AnimatedOpacity(
              opacity: show ? 1 : 0,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: Text(
                "R\$5000,00",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.visibility),
              alignment: Alignment.topLeft,
              onPressed: () => _visibility(!show),
            ),
          )),
        ),
      ),
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        selectedItemColor: const Color.fromARGB(255, 255, 0, 106),
        onTap: onTabTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: 'Carteira',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet_giftcard),
            label: 'Movimentação',
          ),
        ],
      ),
    );
  }
// Selected
}
