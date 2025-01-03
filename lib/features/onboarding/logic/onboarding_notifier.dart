import 'package:flutter/material.dart';

import '../domain/onboarding_state_enum.dart';

class OnboardingNotifier with ChangeNotifier {
  OnboardingNotifier();

  OnboardingStateEnum _state = OnboardingStateEnum.screen1;
  OnboardingStateEnum get state => _state;

  void nextState() {
    switch (_state) {
      case OnboardingStateEnum.screen1:
        _state = OnboardingStateEnum.screen2;
        break;
      case OnboardingStateEnum.screen2:
        _state = OnboardingStateEnum.screen3;
        break;
      case OnboardingStateEnum.screen3:
        _state = OnboardingStateEnum.screen4;
        break;
      case OnboardingStateEnum.screen4:
        _state = OnboardingStateEnum.screen5;
        break;
      case OnboardingStateEnum.screen5:
        _state = OnboardingStateEnum.paywall;
        break;
      case OnboardingStateEnum.paywall:
        break;
    }
    notifyListeners();
  }
}
