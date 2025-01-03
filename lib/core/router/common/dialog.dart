import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../router.dart';

Future<T?> showAppDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool barrierDismissible = true,
}) async {
  final result = await context.router.push(AppDialogRoute(
    barrierDismissible: barrierDismissible,
    builder: builder,
  ));
  if (result is T) {
    return result;
  }
  return null;
}
