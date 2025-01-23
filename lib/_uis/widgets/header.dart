import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Demo service'),
      actions: <Widget>[
        IconButton(onPressed: null, icon: Icon(Icons.notifications)),
        ButtonTheme(child: const Text('TT'))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
