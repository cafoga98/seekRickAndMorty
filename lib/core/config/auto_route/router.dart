import 'package:auto_route/auto_route.dart';

import 'pages.dart';

part 'router.gr.dart';

/// AppRouter
///
/// Manages the routing configuration for the Flutter application using the
/// `auto_route` package. It defines the routes and their initial configuration.
///
/// Example usage:
///
/// ```dart
/// final appRouter = AppRouter();
/// ```
@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends RootStackRouter {

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: HomeRoute.page, path: '/', initial: true),
    AutoRoute(page: CharacterRoute.page, path: '/character', initial: false),
    //AutoRoute(page: LoginRoute.page, path: '/'),
  ];
}