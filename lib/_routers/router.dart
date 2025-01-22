import 'package:auto_route/auto_route.dart';
import 'package:tt_flutter_airdrop_service/_uis/widgets/layout.dart';
import './router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        MaterialRoute(
          page: const PageInfo(''),
          initial: true,
          children: <AutoRoute>[
            AutoRoute(page: const PageInfo('auth'), children: <AutoRoute>[
              AutoRoute(page: const PageInfo('')),
              AutoRoute(page: const PageInfo('signup')),
            ]),
            AutoRoute(page: const PageInfo(''), children: <AutoRoute>[
              AutoRoute(page: const PageInfo('home')),
              AutoRoute(page: const PageInfo('airdrop')),
              AutoRoute(page: const PageInfo('depin')),
            ]),
          ],
        ),
      ];
}
