import 'package:archi_explorer/features/onboarding/logic/onboarding_notifier.dart';
import 'package:archi_explorer/features/onboarding/presentation/widgets/carousel_button.dart';
import 'package:archi_explorer/features/onboarding/presentation/widgets/carousel_item.dart';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: OnboardingBody());
  }
}

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<OnboardingNotifier>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Spacer(),
            CarouselSlider(
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                onPageChanged: (index, reason) => notifier.setPageIndex(index),
                height: 0.6.sh,
                enableInfiniteScroll: false,
                viewportFraction: 1,
              ),
              items: notifier.carouselItemsList
                  .map((e) => CarouselItem(
                        imagePath: e.imagePath,
                        title: e.title,
                        pageIndex: e.pageIndex,
                        description: e.description,
                      ))
                  .toList(),
            ),
            const Spacer(),
            CarouselButtons(buttonCarouselController: buttonCarouselController),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
