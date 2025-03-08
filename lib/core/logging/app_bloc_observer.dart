// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'app_logger.dart';

// final class AppBlocObserver extends BlocObserver {
//   const AppBlocObserver();
//   @override
//   void onChange(BlocBase bloc, Change change) {
//     super.onChange(bloc, change);
//     logInfo('onChange ${bloc.runtimeType} | ${change.currentState} -> ${change.nextState}');
//   }

//   @override
//   void onCreate(BlocBase bloc) {
//     super.onCreate(bloc);
//     logInfo('onCreate ${bloc.runtimeType}');
//   }

//   @override
//   void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
//     super.onError(bloc, error, stackTrace);
//     logError('onError ${bloc.runtimeType}', error, stackTrace);
//   }

//   @override
//   void onClose(BlocBase bloc) {
//     super.onClose(bloc);
//     logInfo('onClose ${bloc.runtimeType} | state ${bloc.state}');
//   }

//   @override
//   void onEvent(Bloc bloc, Object? event) {
//     super.onEvent(bloc, event);
//     logInfo('onEvent ${bloc.runtimeType} | event $event');
//   }

//   @override
//   void onTransition(Bloc bloc, Transition transition) {
//     super.onTransition(bloc, transition);
//     logInfo('onTransition ${bloc.runtimeType} | ${transition.currentState} -> ${transition.nextState}');
//   }
// }
