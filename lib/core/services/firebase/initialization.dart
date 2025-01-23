import 'dart:async';

import 'package:flutter/material.dart';

import '../../logging/app_logger.dart';

Future<void> initFirebase() async {
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlutterError.onError = (details) {
    logError('Flutter error', details.exception, details.stack);
    // FirebaseCrashlytics.instance.recordFlutterError(details);
  };
}

void zoneErrorHandler(Object error, StackTrace stackTrace) {
  logError('Zone error', error, stackTrace);
  // FirebaseCrashlytics.instance.recordError(error, stackTrace);
}
