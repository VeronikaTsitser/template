import 'package:archi_explorer/core/presentation/theme.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CarouselIndicator extends StatelessWidget {
  const CarouselIndicator({super.key, required this.pageIndex});
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
        dotsCount: 2,
        position: pageIndex,
        decorator: const DotsDecorator(
          activeColor: AppColors.black,
          color: AppColors.greyContainer,
        ));
  }
}
