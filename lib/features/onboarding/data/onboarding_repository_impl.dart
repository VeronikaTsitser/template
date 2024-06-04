import 'package:archi_explorer/features/onboarding/data/carousel_items_list.dart';
import 'package:archi_explorer/features/onboarding/domain/models/carousel_item_model.dart';
import 'package:archi_explorer/features/onboarding/domain/onboarding_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  @override
  Future<List<CarouselItemModel>> getItems() async {
    return carouselItemsList;
  }

  @override
  Future<bool> isOnboardingShown() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool('isOnboardingShown') ?? false;
  }

  @override
  Future<void> setOnboardingShown() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool('isOnboardingShown', true);
  }
}
