import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/onboarding_state_enum.dart';
import '../logic/onboarding_notifier.dart';
import 'onboarding_body_1.dart';
import 'onboarding_body_2.dart';
import 'onboarding_body_3.dart';
import 'onboarding_body_4.dart';
import 'onboarding_body_5.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _Body());
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<OnboardingNotifier>();
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: switch (notifier.state) {
          OnboardingStateEnum.screen1 => const OnboardingBody1(),
          OnboardingStateEnum.screen2 => const OnboardingBody2(),
          OnboardingStateEnum.screen3 => const OnboardingBody3(),
          OnboardingStateEnum.screen4 => const OnboardingBody4(),
          OnboardingStateEnum.screen5 => const OnboardingBody5(),
          OnboardingStateEnum.paywall => const SizedBox(), //TODO
        });
  }
}
