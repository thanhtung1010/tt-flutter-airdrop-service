import 'package:auto_route/auto_route.dart';
import 'package:tt_flutter_airdrop_service/_router/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    MaterialRoute(
      path: '/',
      page: LayoutRoute.page,
      initial: true,
      children: <MaterialRoute>[
        MaterialRoute(
          path: 'home',
          page: HomeRoute.page,
        ),
        MaterialRoute(
          path: 'airdrop',
          page: AirdropRoute.page,
        ),
        MaterialRoute(
          path: 'depin',
          page: DepinRoute.page,
        ),
      ],
    ),
  ];
}
