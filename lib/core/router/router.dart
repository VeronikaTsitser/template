import 'package:archi_explorer/features/feed/presentation/feed_screen.dart';
import 'package:archi_explorer/features/loading/loading_screen.dart';
import 'package:archi_explorer/features/nav_bar/presentation/home_screen.dart';
import 'package:archi_explorer/features/onboarding/presentation/onboarding_screen.dart';
import 'package:auto_route/auto_route.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoadingRoute.page, initial: true),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: HomeRoute.page, children: [
          AutoRoute(page: FeedRoute.page, initial: true),
        ]),
      ];
}
