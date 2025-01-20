import 'package:flutter/material.dart';
import 'package:tt_flutter_airdrop_service/_uis/widgets/layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // initialRoute: AppRoutes.HOME,
      // onGenerateRoute: AppRoutes.generateRoute,
      home: LayoutWidget(),
    );
  }
}
