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
  void initState() {
    super.initState();
    if (context.router.isRouteActive('HomeRoute')) {
      setState(() {
        _selectedIndex = 0;
      });
    }
    if (context.router.isRouteActive('AirdropRoute')) {
      setState(() {
        _selectedIndex = 1;
      });
    }
    if (context.router.isRouteActive('DepinRoute')) {
      setState(() {
        _selectedIndex = 2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Colors.deepPurpleAccent,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextButton(
              onPressed: () {
                if (!context.router.isRouteActive('HomeRoute')) {
                  context.router.push(HomeRoute());
                }
                setState(() {
                  _selectedIndex = 0;
                });
              },
              style: TextButton.styleFrom(
                iconColor: Colors.white,
                iconSize: 25,
                textStyle: TextStyle(color: Colors.white),
              ),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 4,
                children: <Widget>[
                  Icon(Icons.home_outlined),
                  _selectedIndex == 0
                      ? Text(
                          'Home',
                          style: TextStyle(color: Colors.white),
                        )
                      : Text(''),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                if (!context.router.isRouteActive('AirdropRoute')) {
                  context.router.push(AirdropRoute());
                }
                setState(() {
                  _selectedIndex = 1;
                });
              },
              style: TextButton.styleFrom(
                iconColor: Colors.white,
                iconSize: 25,
                textStyle: TextStyle(color: Colors.white),
              ),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.touch_app_outlined),
                  _selectedIndex == 1
                      ? Text(
                          'Tap',
                          style: TextStyle(color: Colors.white),
                        )
                      : Text(''),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                if (!context.router.isRouteActive('DepinRoute')) {
                  context.router.push(DepinRoute());
                }
                setState(() {
                  _selectedIndex = 2;
                });
              },
              style: TextButton.styleFrom(
                iconColor: Colors.white,
                iconSize: 25,
                textStyle: TextStyle(color: Colors.white),
              ),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.multiline_chart_sharp),
                  _selectedIndex == 2
                      ? Text(
                          'Depin',
                          style: TextStyle(color: Colors.white),
                        )
                      : Text(''),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
