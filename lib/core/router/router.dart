import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/feed/presentation/feed_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/loading/presentation/loading_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import 'modal_screens/app_bottom_sheet_screen.dart';
import 'modal_screens/app_dialog_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(page: LoadingRoute.page, initial: true),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(
          page: HomeRoute.page,
          children: [
            AutoRoute(page: FeedRoute.page, initial: true),
          ],
        ),
        CustomRoute(
          page: AppDialogRoute.page,
          fullscreenDialog: true,
          customRouteBuilder: _buildAppDialog,
        ),
        CustomRoute(
          page: AppModalBottomSheetRoute.page,
          fullscreenDialog: true,
          customRouteBuilder: _buildAppModalBottomSheet,
        ),
      ];

  Route<T> _buildAppModalBottomSheet<T>(
    BuildContext context,
    Widget child,
    AutoRoutePage<dynamic> page,
  ) {
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    final widget = page.child as AppModalBottomSheetScreen;
    return ModalBottomSheetRoute(
      builder: widget.builder,
      isScrollControlled: widget.isScrollControlled,
      scrollControlDisabledMaxHeightRatio: widget.scrollControlDisabledMaxHeightRatio,
      barrierLabel: widget.barrierLabel ?? localizations.scrimLabel,
      barrierOnTapHint: localizations.scrimOnTapHint(localizations.bottomSheetLabel),
      backgroundColor: widget.backgroundColor,
      elevation: widget.elevation,
      shape: widget.shape,
      clipBehavior: widget.clipBehavior,
      constraints: widget.constraints,
      isDismissible: widget.isDismissible,
      modalBarrierColor: widget.barrierColor ?? Theme.of(context).bottomSheetTheme.modalBarrierColor,
      enableDrag: widget.enableDrag,
      showDragHandle: widget.showDragHandle,
      settings: page,
      anchorPoint: widget.anchorPoint,
      useSafeArea: widget.useSafeArea,
    );
  }

  Route<T> _buildAppDialog<T>(
    BuildContext context,
    Widget child,
    AutoRoutePage<dynamic> page,
  ) {
    final widget = page.child as AppDialogScreen;
    return Platform.isIOS
        ? CupertinoDialogRoute(
            barrierDismissible: widget.barrierDismissible,
            settings: page,
            context: context,
            builder: (context) => child,
          )
        : DialogRoute(
            barrierDismissible: widget.barrierDismissible,
            settings: page,
            context: context,
            builder: (context) => child,
          );
  }
}
