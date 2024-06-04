import 'package:archi_explorer/core/router/router.dart';
import 'package:archi_explorer/features/onboarding/logic/onboarding_notifier.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    final notifier = context.read<OnboardingNotifier>();
    final router = AutoRouter.of(context);
    notifier.init().then((_) {
      if (notifier.isOnboardingShown) {
        router.pushAndPopUntil(const HomeRoute(), predicate: (_) => false);
      } else {
        router.pushAndPopUntil(const OnboardingRoute(), predicate: (_) => false);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
