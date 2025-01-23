import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/presentation/theme.dart';
import '../../../core/router/router.dart';
import 'nav_bar_widget.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bg,
      child: SafeArea(
        child: AutoTabsRouter(
            routes: const [
              FeedRoute(),
            ],
            builder: (context, child) => Scaffold(
                  body: child,
                  bottomNavigationBar: const NavBarWidget(),
                )),
      ),
    );
  }
}
