import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorageService {
  Future<void> init();
  SharedPreferences get prefs;
}

class LocalStorageServiceImpl implements LocalStorageService {
  late SharedPreferences _prefs;
  @override
  Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  @override
  SharedPreferences get prefs => _prefs;
}
