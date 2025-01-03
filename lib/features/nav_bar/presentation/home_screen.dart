import 'package:template/core/presentation/theme.dart';
import 'package:template/core/router/router.dart';
import 'package:template/features/nav_bar/presentation/nav_bar_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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
