import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../router/router.dart';
import 'app_logger.dart';

final class AppNavigatorObserver extends AutoRouterObserver {
  AppNavigatorObserver();

  String? _getRouteName(RouteSettings? settings) {
    final args = settings?.arguments;
    if (args is AppDialogRouteArgs) {
      return '${settings?.name}${args.key ?? ''}';
    }
    if (args is AppModalBottomSheetRouteArgs) {
      return '${settings?.name}${args.key ?? ''}';
    }
    return settings?.name;
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    final newRouteName = _getRouteName(route.settings);
    final previousRouteName = _getRouteName(previousRoute?.settings);
    logInfo('APP_ROUTER PUSH: $previousRouteName -> $newRouteName');
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    final poppedRouteName = _getRouteName(route.settings);
    final returnedRouteName = _getRouteName(previousRoute?.settings);
    logInfo('APP_ROUTER POP: $poppedRouteName -> $returnedRouteName');
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    final newRouteName = _getRouteName(newRoute?.settings);
    final replacedRouteName = _getRouteName(oldRoute?.settings);
    logInfo('APP_ROUTER REPLACE: $replacedRouteName -> $newRouteName');
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    final removedRouteName = _getRouteName(route.settings);
    logInfo('APP_ROUTER REMOVE: $removedRouteName');
    super.didRemove(route, previousRoute);
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    logInfo('APP_ROUTER TAB_INIT: ${route.name}');
    super.didInitTabRoute(route, previousRoute);
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    logInfo('APP_ROUTER TAB_CHANGE: ${previousRoute.name} -> ${route.name}');
    super.didChangeTabRoute(route, previousRoute);
  }
}
