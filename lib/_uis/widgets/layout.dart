import 'package:flutter/material.dart';
import 'package:tt_flutter_airdrop_service/_uis/widgets/bottom-bar.dart';
import 'package:tt_flutter_airdrop_service/_uis/widgets/header.dart';

class LayoutWidget extends StatelessWidget {
  const LayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      bottomNavigationBar: BottomBarWidget(),
    );
  }
}
