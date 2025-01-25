import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/local_storage_service/local_storage_service.dart';
import '../../../core/presentation/widgets/app_progress_indicator.dart';
import '../data/template_example_repository_impl.dart';
import '../logic/template_example_notifier.dart';

@RoutePage()
class TemplateExampleScreen extends StatelessWidget {
  const TemplateExampleScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TemplateExampleNotifier(
        TemplateExampleRepositoryImpl(context.read<LocalStorageService>()),
      )..init(),
      child: const Scaffold(
        body: SafeArea(
          child: _Body(),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final humanDesignNotifier = context.watch<TemplateExampleNotifier>();
    return humanDesignNotifier.isLoading ? const Center(child: AppProgressIndicator()) : const SizedBox(); //TODO
  }
}
