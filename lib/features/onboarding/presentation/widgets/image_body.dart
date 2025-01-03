import 'package:flutter/material.dart';

class ImageBody extends StatelessWidget {
  const ImageBody({
    super.key,
    // required this.image, //TODO
    required this.title,
    required this.description,
  });
  // final AssetGenImage image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Flexible(child: image.image()),
                const SizedBox(height: 20),
                Text(
                  title,
                  // style: CustomText.title2BoldLC, //TODO
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  // style: CustomText.calloutRegular.copyWith(color: CustomColors.secondaryLabel), //TODO
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
