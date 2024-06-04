import 'package:archi_explorer/features/onboarding/domain/models/carousel_item_model.dart';
import 'package:archi_explorer/features/onboarding/domain/onboarding_repository.dart';
import 'package:flutter/material.dart';

class OnboardingNotifier with ChangeNotifier {
  OnboardingNotifier(this.repository);
  final OnboardingRepository repository;

  Future<void> init() async {
    await checkIsOnboardingShown();
  }

  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  void setPageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  final List<CarouselItemModel> _carouselItemsList = [];
  List<CarouselItemModel> get carouselItemsList => _carouselItemsList;

  Future<void> getItems() async {
    _carouselItemsList.addAll(await repository.getItems());
    notifyListeners();
  }

  bool _isOnboardingShown = false;
  bool get isOnboardingShown => _isOnboardingShown;
  void setOnboardingShown() {
    repository.setOnboardingShown();
    _isOnboardingShown = true;
    notifyListeners();
  }

  Future<void> checkIsOnboardingShown() async {
    _isOnboardingShown = await repository.isOnboardingShown();
    if (!_isOnboardingShown) await getItems();
    notifyListeners();
  }
}
