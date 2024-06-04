import 'package:archi_explorer/core/presentation/theme.dart';
import 'package:archi_explorer/features/onboarding/presentation/widgets/carousel_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.pageIndex,
  });
  final String imagePath;
  final String title;
  final String description;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(child: Image.asset(imagePath)),
        const SizedBox(height: 20),
        AutoSizeText(
          title,
          style: AppTextStyle.s19w700,
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
        const SizedBox(height: 12),
        AutoSizeText(
          description,
          style: AppTextStyle.s14w400,
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
        const SizedBox(height: 12),
        CarouselIndicator(pageIndex: pageIndex),
      ],
    );
  }
}
