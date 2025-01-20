import 'package:flutter/material.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: null,
            icon: Icon(Icons.home_sharp),
            tooltip: 'Home',
          ),
          Spacer(),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.touch_app_outlined),
            tooltip: 'Airdrop',
          ),
          Spacer(),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.multiline_chart_sharp),
            tooltip: 'Depin',
          ),
        ],
      ),
    );
  }
}
