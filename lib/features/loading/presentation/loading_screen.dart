import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/router/router.dart';
import '../domain/enum.dart';
import '../logic/initialization_notifier.dart';

@RoutePage()
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late InitializationNotifier notifier;
  late final StackRouter router;

  @override
  void initState() {
    notifier = context.read<InitializationNotifier>();
    notifier
      ..addListener(_onListen)
      ..init();
    router = AutoRouter.of(context);
    super.initState();
  }

  @override
  void dispose() {
    notifier.removeListener(_onListen);
    super.dispose();
  }

  void _onListen() {
    switch (notifier.isInitialized) {
      case InitializationEnum.home:
        router.pushAndPopUntil(const HomeRoute(), predicate: (_) => false);
        break;
      case InitializationEnum.onboarding:
        router.pushAndPopUntil(const OnboardingRoute(), predicate: (_) => false);
        break;
      case InitializationEnum.loading:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
