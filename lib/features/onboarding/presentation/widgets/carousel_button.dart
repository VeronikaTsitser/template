import 'package:archi_explorer/core/presentation/theme.dart';
import 'package:archi_explorer/core/router/router.dart';
import 'package:archi_explorer/features/onboarding/logic/onboarding_notifier.dart';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarouselButtons extends StatelessWidget {
  const CarouselButtons({super.key, required this.buttonCarouselController});

  final CarouselController buttonCarouselController;

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<OnboardingNotifier>();
    return notifier.pageIndex == 1
        ? ElevatedButton(
            onPressed: () {
              AutoRouter.of(context).replace(const HomeRoute());
              notifier.setOnboardingShown();
            },
            child: const Text('Начать'),
          )
        : Row(
            children: [
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle: AppTextStyle.s14w700.copyWith(color: AppColors.primary),
                    foregroundColor: AppColors.primary,
                  ),
                  onPressed: () {
                    AutoRouter.of(context).replace(const FeedRoute());
                    notifier.setOnboardingShown();
                  },
                  child: const Text('Пропустить'),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.greyContainer, foregroundColor: AppColors.primary),
                  onPressed: () => buttonCarouselController.nextPage(),
                  child: const Text('Далее'),
                ),
              ),
            ],
          );
  }
}
