import 'dart:developer' show log;

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import '../services/firebase/crashlytics.dart';
import 'app_persistent_logger.dart';

export 'app_navigator_observer.dart';

Logger get _logger => Logger(
      output: ConsoleOutput(
        truncate: false,
      ),
      printer: PrettyPrinter(
        methodCount: 0,
        colors: true,
        dateTimeFormat: DateTimeFormat.none,
        printEmojis: false,
        noBoxingByDefault: true,
        lineLength: 80,
      ),
    );

void logDebug(dynamic data) {
  _logger.d(data);
  appPersistentLogger.d(data);
}

void logInfo(dynamic data) {
  _logger.i(data);
  appPersistentLogger.i(data);
  if (kReleaseMode) {
    recordCrashlyticsLog(data.toString());
  }
}

void logError(dynamic data, [dynamic error, StackTrace? stackTrace]) {
  _logger.e(data, error: error, stackTrace: stackTrace);
  appPersistentLogger.e(data, error: error, stackTrace: stackTrace);
  if (kReleaseMode) {
    recordCrashlyticsError(error, stackTrace, reason: data.toString());
  }
}

class ConsoleOutput extends LogOutput {
  final int lineLength;
  final bool truncate;
  ConsoleOutput({this.lineLength = 80, this.truncate = true});
  @override
  void output(OutputEvent event) {
    List<String> lines = [...event.lines];
    if (lines.length > lineLength && truncate) {
      lines = lines.sublist(0, lineLength);
      lines.add('...');
    }

    if (kIsWeb || kIsWasm) {
      for (var element in lines) {
        log(element);
      }
    } else {
      log(lines.join('\n'));
    }
  }
}
