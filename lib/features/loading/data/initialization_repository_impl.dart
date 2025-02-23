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

    final isOnboardingShown = await _localStorageService.getValueAsync<bool>(StorageKeys.isOnboardingShownKey) ?? false;
    return isOnboardingShown ? InitializationEnum.home : InitializationEnum.onboarding;
  }

  @override
  Future<void> setOnboardingShown() async {
    await _localStorageService.setValue<bool>(StorageKeys.isOnboardingShownKey, true);
  }

  Future<void> _initAbTestService() async {
    // await _abTestService.init(); //TODO
  }

  Future<void> _initLocalStorageService() async {
    await _localStorageService.init();
  }
}
