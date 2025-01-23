import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'core/localization/localization_config.dart';
import 'core/presentation/theme.dart';
import 'core/router/router.dart';
import 'core/services/local_storage_service/local_storage_service.dart';
import 'features/loading/data/initialization_repository_impl.dart';
import 'features/loading/domain/initialization_repository.dart';
import 'features/onboarding/logic/onboarding_notifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        Provider<LocalStorageService>(create: (_) => LocalStorageServiceImpl()),
        RepositoryProvider<InitializationRepository>(
          create: (context) => InitializationRepositoryImpl(
            context.read<LocalStorageService>(),
          ),
        ),
        ChangeNotifierProvider(create: (context) => OnboardingNotifier()),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        theme: darkTheme,
        supportedLocales: LocalizationConfig.supportedLocales,
        localizationsDelegates: LocalizationConfig.localizationsDelegates,
        localeResolutionCallback: LocalizationConfig.localeResolutionCallback,
      ),
    );
  }
}
