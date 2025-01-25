import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'mobile_nav_bar.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        // BirthChartRoute(),
        // WisdomRoute(),
        // MoonRoute(),
        // CompatibilityRoute(),
        // HumanDesignRoute(),
      ],
      builder: (context, child) => Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     final pref = await SharedPreferences.getInstance();
        //     pref.remove(StorageKeys.ratingState);
        //     pref.remove(StorageKeys.firstOpenCalendar);
        //     pref.remove(StorageKeys.firstOpenTarot);
        //     pref.remove(StorageKeys.firstOpenRunes);
        //   },
        //   child: const Icon(Icons.person),
        // ), //TODO убрать
        bottomNavigationBar: const MobileNavBar(),
        body: child,
      ),
    );
  }
}
