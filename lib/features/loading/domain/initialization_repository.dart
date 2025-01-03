import 'enum.dart';

abstract class InitializationRepository {
  Future<InitializationEnum> init();
  Future<void> setOnboardingShown();
}
