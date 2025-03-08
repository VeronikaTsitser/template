import 'package:logger/logger.dart';

String get logFilePath => '';

Logger get appPersistentLogger => Logger(
      filter: _FileLogFilter(),
      output: EmptyOutput(),
      printer: PrettyPrinter(
        methodCount: 0,
        colors: false,
        dateTimeFormat: DateTimeFormat.none,
        printEmojis: false,
        noBoxingByDefault: true,
        lineLength: 80,
      ),
    );

Future<void> initSaveLogger() async {}

Future<void> clearLogData() async {}

class _FileLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    if (event.level == Level.info) {
      return true;
    }
    return false;
  }
}

class EmptyOutput extends LogOutput {
  @override
  void output(OutputEvent event) {}
}
