import 'dart:developer' show log;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import '../services/firebase/crashlytics.dart';

export 'app_bloc_observer.dart';
export 'app_navigator_observer.dart';

Future<void> initSaveLogger() async {
  if (kIsWeb) {
    debugPrint('Path provider is not supported for web.');
    return;
  }
  final dir = await getApplicationDocumentsDirectory();
  final path = dir.path;
  const fileName = 'latest.txt';
  final output = AdvancedFileOutput(path: path, latestFileName: fileName);
  await output.init();
  _saveLogFileOutput = output;
  _logFilePath = '$path/$fileName';
}

Future<void> clearLogData() async {
  final file = File(_logFilePath);
  await file.writeAsString('');
}

late LogOutput _saveLogFileOutput;
late String _logFilePath;
String get logFilePath => _logFilePath;

Logger get _saveLogger => Logger(
      filter: _FileLogFilter(),
      output: _saveLogFileOutput,
      printer: PrettyPrinter(
        methodCount: 0,
        colors: false,
        dateTimeFormat: DateTimeFormat.none,
        printEmojis: false,
        noBoxingByDefault: true,
        lineLength: 80,
      ),
    );

Logger get _logger => Logger(
      output: ConsoleOutput(
        truncate: false,
      ),
      printer: PrettyPrinter(
        colors: true,
        dateTimeFormat: DateTimeFormat.none,
        printEmojis: false,
        noBoxingByDefault: false,
        lineLength: 80,
      ),
    );

Logger get _truncateLogger => Logger(
      output: ConsoleOutput(
        truncate: true,
      ),
      printer: PrettyPrinter(
        colors: true,
        dateTimeFormat: DateTimeFormat.none,
        printEmojis: false,
        noBoxingByDefault: false,
        lineLength: 80,
      ),
    );

bool get _enableLogger => true;

bool get _showAppRouter => true;
bool get _showRestApi => true;
bool get _showChangeNotifier => true;
bool get _showMetrica => true;
bool get _showAds => true;
bool get _showAbTest => true;
bool get _showLocalStorage => true;
bool get _showLocalisation => true;
bool get _showFirebase => true;
bool get _showLocalNotificationsService => true;
bool get _showDebouncer => false;

void logData(dynamic data) {
  _logger.t(data);
  _saveLogger.t(data);
}

void logInfo(dynamic data) {
  _logger.i(data);
  _saveLogger.i(data);
  if (kReleaseMode) {
    recordCrashlyticsLog(data.toString());
  }
}

void logError(dynamic data, [dynamic error, StackTrace? stackTrace]) {
  _logger.e(data, error: error, stackTrace: stackTrace);
  _saveLogger.e(data, error: error, stackTrace: stackTrace);
  if (kReleaseMode) {
    recordCrashlyticsError(error, stackTrace, reason: data.toString());
  }
}

// APP ROUTER logs
void logAppRouter(dynamic data) => _showAppRouter ? logInfo(data) : null;
void logErrorAppRouter(dynamic data, [dynamic error, StackTrace? stackTrace]) {
  _showAppRouter ? logError(data, error, stackTrace) : null;
}

// REST API logs
void logRestApi(dynamic data) => _showRestApi ? _truncateLogger.i(data) : null;
void logErrorRestApi(dynamic data, [dynamic error, StackTrace? stackTrace]) {
  _showRestApi ? logError(data, error, stackTrace) : null;
}

// Change notifier logs
void logChangeNotifier(dynamic data) => _showChangeNotifier ? logInfo(data) : null;
void logErrorChangeNotifier(dynamic data, [dynamic error, StackTrace? stackTrace]) {
  _showChangeNotifier ? logError(data, error, stackTrace) : null;
}

// Metrica logs
void logMetrica(dynamic data) {
  if (_showMetrica) {
    logInfo(data);
  }
}

void logErrorMetrica(dynamic data, [dynamic error, StackTrace? stackTrace]) {
  _showMetrica ? logError(data, error, stackTrace) : null;
}

// Ad logs
void logAds(dynamic data) => _showAds ? logInfo(data) : null;
void logErrorAds(dynamic data, [dynamic error, StackTrace? stackTrace]) {
  _showAds ? logError(data, error, stackTrace) : null;
}

// Ad logs
void logAbTest(dynamic data) => _showAbTest ? logInfo(data) : null;
void logErrorAbTest(dynamic data, [dynamic error, StackTrace? stackTrace]) {
  _showAbTest ? logError(data, error, stackTrace) : null;
}

// LocalStorage logs
void logLocalStorage(dynamic data) => _showLocalStorage ? logInfo(data) : null;
void logErrorLocalStorage(dynamic data, [dynamic error, StackTrace? stackTrace]) {
  _showLocalStorage ? logError(data, error, stackTrace) : null;
}

// Localisation logs
void logLocalisation(dynamic data) => _showLocalisation ? logInfo(data) : null;

// Firebase logs
void logFirebase(dynamic data) => _showFirebase ? logInfo(data) : null;
void logErrorFirebase(dynamic data, [dynamic error, StackTrace? stackTrace]) {
  _showFirebase ? logError(data, error, stackTrace) : null;
}

// Local notifications logs
void logLocalNotifications(dynamic data) => _showLocalNotificationsService ? logInfo(data) : null;

// delayed or restorable callback logs
void logDebouncer(dynamic data) => _showDebouncer ? logInfo(data) : null;

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
    if (_enableLogger) {
      if (kIsWeb) {
        for (var element in lines) {
          log(element);
        }
      } else {
        log(lines.join('\n'));
      }
    }
  }
}

class _FileLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    if (event.level == Level.info) {
      return true;
    }
    return false;
  }
}
