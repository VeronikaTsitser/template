import '../../../../core/services/local_storage_service/local_storage_service.dart';
import '../domain/template_example_repository.dart';

class TemplateExampleRepositoryImpl implements TemplateExampleRepository {
  TemplateExampleRepositoryImpl(this._localStorageService);
  final LocalStorageService _localStorageService;
}
