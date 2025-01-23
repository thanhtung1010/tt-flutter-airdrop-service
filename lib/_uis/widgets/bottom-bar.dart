import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tt_flutter_airdrop_service/_router/router.gr.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  State<BottomBarWidget> createState() => BottomBarWidgetState();
}

class BottomBarWidgetState extends State<BottomBarWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: _selectedIndex,
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      destinations: <Widget>[
        NavigationDestination(
          icon: IconButton(
            onPressed: () {
              context.router.push(HomeRoute());
              setState(() {
                _selectedIndex = 0;
              });
            },
            icon: Icon(Icons.home_sharp),
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          label: 'Home',
        ),
        NavigationDestination(
          icon: IconButton(
            onPressed: () {
              context.router.push(AirdropRoute());
              setState(() {
                _selectedIndex = 1;
              });
            },
            icon: Icon(Icons.touch_app_outlined),
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          label: 'Airdrop',
        ),
        NavigationDestination(
          icon: IconButton(
            onPressed: () {
              context.router.push(DepinRoute());
              setState(() {
                _selectedIndex = 2;
              });
            },
            icon: Icon(Icons.multiline_chart_sharp),
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          label: 'Depin',
        ),
      ],
    );
  }
}
