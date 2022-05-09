import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listagem_crypto/l10n/l10n.dart';
import 'package:listagem_crypto/shared/themes/app_colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'screens/home/home_page.dart';
import 'screens/wallet/home_wallet.dart';
import 'shared/widgets/bottom_nav_bar.dart';

void main() {
  Intl.defaultLocale = 'pt_BR';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/navBar',
      routes: {
        '/homeWallet': (BuildContext context) => const HomeWalletPage(),
        '/homepagge': (BuildContext context) => const HomePage(),
        '/navBar': (BuildContext context) => const BottomNavBar()
      },
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
      theme: ThemeData(primaryColor: AppColors.primary),
      debugShowCheckedModeBanner: false,
    );
  }
}
