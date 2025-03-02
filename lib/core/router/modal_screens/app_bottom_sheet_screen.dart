import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../presentation/theme.dart';

@RoutePage()
class AppModalBottomSheetScreen extends StatelessWidget {
  const AppModalBottomSheetScreen({
    super.key,
    required this.builder,
    this.backgroundColor,
    this.barrierLabel,
    this.elevation,
    this.shape,
    this.clipBehavior,
    this.constraints,
    this.barrierColor,
    required this.isScrollControlled,
    required this.scrollControlDisabledMaxHeightRatio,
    required this.useRootNavigator,
    required this.isDismissible,
    required this.enableDrag,
    this.showDragHandle,
    required this.useSafeArea,
    this.routeSettings,
    this.transitionAnimationController,
    this.anchorPoint,
    this.sheetAnimationStyle,
  });

  final WidgetBuilder builder;
  final Color? backgroundColor;
  final String? barrierLabel;
  final double? elevation;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final BoxConstraints? constraints;
  final Color? barrierColor;
  final bool isScrollControlled;
  final double scrollControlDisabledMaxHeightRatio;
  final bool useRootNavigator;
  final bool isDismissible;
  final bool enableDrag;
  final bool? showDragHandle;
  final bool useSafeArea;
  final RouteSettings? routeSettings;
  final AnimationController? transitionAnimationController;
  final Offset? anchorPoint;
  final AnimationStyle? sheetAnimationStyle;

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}

class AppBottomSheetWrapper extends StatelessWidget {
  const AppBottomSheetWrapper({
    super.key,
    required this.child,
    this.expand = false,
    this.topSafeArea = true,
    this.bottomSafeArea = true,
  });
  final Widget child;
  final bool expand;
  final bool topSafeArea;
  final bool bottomSafeArea;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: topSafeArea,
      bottom: bottomSafeArea,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
            children: [
              Container(
                width: 72,
                height: 5,
                decoration: const BoxDecoration(
                  color: AppColors.greyContainer,
                  borderRadius: AppBorderRadius.all16,
                ),
              ),
              const SizedBox(height: 16),
              Flexible(child: child),
            ],
          ),
        ),
      ),
    );
  }
}
