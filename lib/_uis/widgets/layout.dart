import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tt_flutter_airdrop_service/_uis/widgets/bottom-bar.dart';
import 'package:tt_flutter_airdrop_service/_uis/widgets/header.dart';

@RoutePage()
class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      body: AutoRouter(),
      bottomNavigationBar: BottomBarWidget(),
    );
  }
}