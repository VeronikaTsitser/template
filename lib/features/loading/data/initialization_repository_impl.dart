import '../../../core/services/local_storage_service/local_storage_service.dart';
import '../../../core/services/local_storage_service/storage_keys.dart';
import '../domain/enum.dart';
import '../domain/initialization_repository.dart';

class InitializationRepositoryImpl implements InitializationRepository {
  InitializationRepositoryImpl(this._localStorageService);
  final LocalStorageService _localStorageService;

  @override
  Future<InitializationEnum> init() async {
    await _initLocalStorageService();
    await _initAbTestService();

    final pref = _localStorageService.prefs;
    final isOnboardingShown = pref.getBool(StorageKeys.isOnboardingShownKey) ?? false;
    return isOnboardingShown ? InitializationEnum.home : InitializationEnum.onboarding;
  }

  @override
  Future<void> setOnboardingShown() async {
    final pref = _localStorageService.prefs;
    await pref.setBool(StorageKeys.isOnboardingShownKey, true);
  }

  Future<void> _initAbTestService() async {
    // await _abTestService.init(); //TODO
  }

  Future<void> _initLocalStorageService() async {
    await _localStorageService.init();
  }
}
