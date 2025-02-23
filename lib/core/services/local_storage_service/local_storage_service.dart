import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorageService {
  Future<void> init();
  T? getValue<T>(String key);
  Future<T?> getValueAsync<T>(String key);
  Future<void> setValue<T>(String key, T value);
}

class LocalStorageServiceImpl implements LocalStorageService {
  SharedPreferences? _prefs;

  @override
  T? getValue<T>(String key) {
    if (_prefs == null) {
      throw Exception('SharedPreferences is not initialized');
    }
    return _prefs!.get(key) as T?;
  }

  @override
  Future<T?> getValueAsync<T>(String key) async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!.get(key) as T?;
  }

  @override
  Future<void> setValue<T>(String key, T value) async {
    _prefs ??= await SharedPreferences.getInstance();
    if (value is bool) {
      await _prefs!.setBool(key, value as bool);
    } else if (value is int) {
      await _prefs!.setInt(key, value as int);
    } else if (value is double) {
      await _prefs!.setDouble(key, value as double);
    } else if (value is String) {
      await _prefs!.setString(key, value as String);
    } else if (value is List<String>) {
      await _prefs!.setStringList(key, value as List<String>);
    } else {
      throw Exception('Unsupported type');
    }
  }

  @override
  Future<void> init() async => _prefs = await SharedPreferences.getInstance();
}
