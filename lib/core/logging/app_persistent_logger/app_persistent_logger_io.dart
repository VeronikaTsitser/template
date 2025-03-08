import 'dart:io';

import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

LogOutput? _saveLogFileOutput;
late String _logFilePath;
String get logFilePath => _logFilePath;

Logger get appPersistentLogger => Logger(
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

Future<void> initSaveLogger() async {
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

class _FileLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    if (event.level == Level.info) {
      return true;
    }
    return false;
  }
}
