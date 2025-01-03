import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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
