// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [AppDialogScreen]
class AppDialogRoute extends PageRouteInfo<AppDialogRouteArgs> {
  AppDialogRoute({
    Key? key,
    required WidgetBuilder builder,
    required bool barrierDismissible,
    List<PageRouteInfo>? children,
  }) : super(
          AppDialogRoute.name,
          args: AppDialogRouteArgs(
            key: key,
            builder: builder,
            barrierDismissible: barrierDismissible,
          ),
          initialChildren: children,
        );

  static const String name = 'AppDialogRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AppDialogRouteArgs>();
      return AppDialogScreen(
        key: args.key,
        builder: args.builder,
        barrierDismissible: args.barrierDismissible,
      );
    },
  );
}

class AppDialogRouteArgs {
  const AppDialogRouteArgs({
    this.key,
    required this.builder,
    required this.barrierDismissible,
  });

  final Key? key;

  final WidgetBuilder builder;

  final bool barrierDismissible;

  @override
  String toString() {
    return 'AppDialogRouteArgs{key: $key, builder: $builder, barrierDismissible: $barrierDismissible}';
  }
}

/// generated route for
/// [AppModalBottomSheetScreen]
class AppModalBottomSheetRoute
    extends PageRouteInfo<AppModalBottomSheetRouteArgs> {
  AppModalBottomSheetRoute({
    Key? key,
    required WidgetBuilder builder,
    Color? backgroundColor,
    String? barrierLabel,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    required bool isScrollControlled,
    required double scrollControlDisabledMaxHeightRatio,
    required bool useRootNavigator,
    required bool isDismissible,
    required bool enableDrag,
    bool? showDragHandle,
    required bool useSafeArea,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
    Offset? anchorPoint,
    AnimationStyle? sheetAnimationStyle,
    List<PageRouteInfo>? children,
  }) : super(
          AppModalBottomSheetRoute.name,
          args: AppModalBottomSheetRouteArgs(
            key: key,
            builder: builder,
            backgroundColor: backgroundColor,
            barrierLabel: barrierLabel,
            elevation: elevation,
            shape: shape,
            clipBehavior: clipBehavior,
            constraints: constraints,
            barrierColor: barrierColor,
            isScrollControlled: isScrollControlled,
            scrollControlDisabledMaxHeightRatio:
                scrollControlDisabledMaxHeightRatio,
            useRootNavigator: useRootNavigator,
            isDismissible: isDismissible,
            enableDrag: enableDrag,
            showDragHandle: showDragHandle,
            useSafeArea: useSafeArea,
            routeSettings: routeSettings,
            transitionAnimationController: transitionAnimationController,
            anchorPoint: anchorPoint,
            sheetAnimationStyle: sheetAnimationStyle,
          ),
          initialChildren: children,
        );

  static const String name = 'AppModalBottomSheetRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AppModalBottomSheetRouteArgs>();
      return AppModalBottomSheetScreen(
        key: args.key,
        builder: args.builder,
        backgroundColor: args.backgroundColor,
        barrierLabel: args.barrierLabel,
        elevation: args.elevation,
        shape: args.shape,
        clipBehavior: args.clipBehavior,
        constraints: args.constraints,
        barrierColor: args.barrierColor,
        isScrollControlled: args.isScrollControlled,
        scrollControlDisabledMaxHeightRatio:
            args.scrollControlDisabledMaxHeightRatio,
        useRootNavigator: args.useRootNavigator,
        isDismissible: args.isDismissible,
        enableDrag: args.enableDrag,
        showDragHandle: args.showDragHandle,
        useSafeArea: args.useSafeArea,
        routeSettings: args.routeSettings,
        transitionAnimationController: args.transitionAnimationController,
        anchorPoint: args.anchorPoint,
        sheetAnimationStyle: args.sheetAnimationStyle,
      );
    },
  );
}

class AppModalBottomSheetRouteArgs {
  const AppModalBottomSheetRouteArgs({
    this.key,
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

  final Key? key;

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
  String toString() {
    return 'AppModalBottomSheetRouteArgs{key: $key, builder: $builder, backgroundColor: $backgroundColor, barrierLabel: $barrierLabel, elevation: $elevation, shape: $shape, clipBehavior: $clipBehavior, constraints: $constraints, barrierColor: $barrierColor, isScrollControlled: $isScrollControlled, scrollControlDisabledMaxHeightRatio: $scrollControlDisabledMaxHeightRatio, useRootNavigator: $useRootNavigator, isDismissible: $isDismissible, enableDrag: $enableDrag, showDragHandle: $showDragHandle, useSafeArea: $useSafeArea, routeSettings: $routeSettings, transitionAnimationController: $transitionAnimationController, anchorPoint: $anchorPoint, sheetAnimationStyle: $sheetAnimationStyle}';
  }
}

/// generated route for
/// [FeedScreen]
class FeedRoute extends PageRouteInfo<void> {
  const FeedRoute({List<PageRouteInfo>? children})
      : super(
          FeedRoute.name,
          initialChildren: children,
        );

  static const String name = 'FeedRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FeedScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [LoadingScreen]
class LoadingRoute extends PageRouteInfo<void> {
  const LoadingRoute({List<PageRouteInfo>? children})
      : super(
          LoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoadingScreen();
    },
  );
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingScreen();
    },
  );
}
