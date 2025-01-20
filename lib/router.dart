import 'package:flutter/material.dart';
import 'package:tt_flutter_airdrop_service/_uis/pages/airdrop.dart';
import 'package:tt_flutter_airdrop_service/_uis/pages/depin.dart';
import 'package:tt_flutter_airdrop_service/_uis/pages/home.dart';

class AppRoutes {
  static const String HOME = '/';
  static const String AIRDROP = '/airdrop';
  static const String DEPIN = '/deposit';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME:
        return MaterialPageRoute(builder: (_) => HomePage());
      case AIRDROP:
        return MaterialPageRoute(builder: (_) => AirdropPage());
      case DEPIN:
        return MaterialPageRoute(builder: (_) => DepinPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }
}
