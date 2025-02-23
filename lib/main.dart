import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'core/localization/localization_config.dart';
import 'core/logging/app_persistent_logger.dart';
import 'core/presentation/theme.dart';
import 'core/router/router.dart';
import 'core/services/firebase/initialization.dart';
import 'core/services/local_storage_service/local_storage_service.dart';
import 'features/loading/data/initialization_repository_impl.dart';
import 'features/loading/domain/initialization_repository.dart';
import 'features/loading/logic/initialization_notifier.dart';
import 'features/onboarding/logic/onboarding_notifier.dart';

void main() => runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        await initFirebase();
        await initSaveLogger();

        runApp(const MyApp());
      },
      zoneErrorHandler,
    );

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
        ChangeNotifierProvider(
          create: (context) => InitializationNotifier(
            context.read<InitializationRepository>(),
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
