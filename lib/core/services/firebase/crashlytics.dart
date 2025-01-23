// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

Future<void> recordCrashlyticsError(
  Object? error,
  StackTrace? stackTrace, {
  String? reason,
}) async {
  if (kDebugMode) return;
  // await FirebaseCrashlytics.instance.recordError(error, stackTrace, reason: reason);
}

Future<void> recordCrashlyticsLog(String? message) async {
  if (kDebugMode || message == null) return;
  // await FirebaseCrashlytics.instance.log(message);
}
