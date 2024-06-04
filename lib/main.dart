import 'package:archi_explorer/core/constant/app_const.dart';
import 'package:archi_explorer/core/presentation/theme.dart';
import 'package:archi_explorer/core/router/router.dart';
import 'package:archi_explorer/features/onboarding/data/onboarding_repository_impl.dart';
import 'package:archi_explorer/features/onboarding/domain/onboarding_repository.dart';
import 'package:archi_explorer/features/onboarding/logic/onboarding_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
    return ScreenUtilInit(
      designSize: AppConst.baseScreenSize,
      child: MultiBlocProvider(
        providers: [
          RepositoryProvider<OnboardingRepository>(create: (context) => OnboardingRepositoryImpl()),
          ChangeNotifierProvider(create: (context) => OnboardingNotifier(context.read<OnboardingRepository>())),
        ],
        child: MaterialApp.router(
          routerConfig: _appRouter.config(),
          theme: darkTheme,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en'), Locale('ru')],
          locale: const Locale('ru'),
        ),
      ),
    );
  }
}
