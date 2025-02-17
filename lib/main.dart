import 'package:flutter/material.dart';
import 'package:tt_flutter_airdrop_service/_router/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// import 'package:tt_flutter_airdrop_service/_uis/widgets/bottom-bar.dart';
// import 'package:tt_flutter_airdrop_service/_uis/widgets/header.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(AirdropService());
}

class AirdropService extends StatefulWidget {
  const AirdropService({super.key});

  @override
  State<AirdropService> createState() => AirdropServiceState();
}

class AirdropServiceState extends State<AirdropService> {
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: appRouter.config(),
    );
  }
}
