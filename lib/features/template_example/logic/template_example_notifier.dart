import 'package:flutter/foundation.dart';

import '../domain/template_example_repository.dart';

class TemplateExampleNotifier with ChangeNotifier {
  TemplateExampleNotifier(this._repository);
  final TemplateExampleRepository _repository;

  Future<void> init() async {
    //TODO
  }

  final bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _clear() {
    //TODO
    notifyListeners();
  }

  bool get isValidated => true; //TODO
}
