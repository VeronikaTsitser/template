import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class MainAppButton extends StatelessWidget {
  const MainAppButton({
    super.key,
    this.width,
    this.color,
    required this.onPressed,
    this.text,
    this.textColor,
    this.image,
    this.disabledColor,
    this.loading = false,
    this.borderColor,
    this.isSmall = false,
    this.child,
    this.textStyle,
    this.heigh,
    this.borderRadius,
  });

  final double? width;
  final double? heigh;
  final bool isSmall;
  final Color? color;
  final Color? borderColor;
  final Color? disabledColor;
  final Color? textColor;
  final String? text;
  final void Function()? onPressed;
  final ImageProvider<Object>? image;
  final bool loading;
  final Widget? child;
  final TextStyle? textStyle;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.transparent, strokeAlign: BorderSide.strokeAlignOutside),
          borderRadius: borderRadius ?? AppBorderRadius.all16),
      width: width ?? MediaQuery.sizeOf(context).width,
      height: heigh ?? 62,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: borderRadius ?? AppBorderRadius.all20),
          minimumSize: const Size(100, 44),
          padding: EdgeInsets.zero,
          backgroundColor: color ?? AppColors.primary,
          foregroundColor: textColor ?? AppColors.white,
          disabledBackgroundColor: disabledColor ?? AppColors.primary.withValues(alpha: 255.0 * 0.5),
        ),
        onPressed: onPressed,
        child: loading
            ? const SizedBox.square(
                dimension: 20,
                child: CircularProgressIndicator(),
              )
            : child ??
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (image != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Image(
                          width: 24,
                          height: 24,
                          alignment: Alignment.center,
                          image: image!,
                          fit: BoxFit.fill,
                        ),
                      ),
                    if (text != null)
                      Text(
                        text!,
                        textAlign: TextAlign.center,
                        style: textStyle ??
                            TextStyle(
                              color: textColor ?? AppColors.white,
                              fontSize: isSmall ? 14 : 16,
                              fontWeight: isSmall ? FontWeight.w400 : FontWeight.w600,
                            ),
                      ),
                  ],
                ),
      ),
    );
  }
}

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      onTap: onTap,
      child: const CircleAvatar(
        radius: 21,
        backgroundColor: AppColors.greyContainer,
        child: Icon(CupertinoIcons.chevron_back, color: AppColors.black),
      ),
    );
  }
}
