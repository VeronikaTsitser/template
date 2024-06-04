import 'package:archi_explorer/features/onboarding/domain/models/carousel_item_model.dart';

abstract class OnboardingRepository {
  Future<List<CarouselItemModel>> getItems();
  Future<bool> isOnboardingShown();
  Future<void> setOnboardingShown();
}
