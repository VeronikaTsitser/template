import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AppDialogScreen extends StatelessWidget {
  const AppDialogScreen({
    super.key,
    required this.builder,
    required this.barrierDismissible,
  });
  final WidgetBuilder builder;
  final bool barrierDismissible;

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}
