import 'package:flutter/cupertino.dart';

import '../domain/enum.dart';
import '../domain/initialization_repository.dart';

class InitializationNotifier with ChangeNotifier {
  InitializationNotifier(this._repository);
  final InitializationRepository _repository;

  InitializationEnum _isInitialized = InitializationEnum.loading;
  InitializationEnum get isInitialized => _isInitialized;

  Future<void> init() async {
    _isInitialized = await _repository.init();
    notifyListeners();
  }

  Future<void> setOnboardingShown() => _repository.setOnboardingShown();
}
