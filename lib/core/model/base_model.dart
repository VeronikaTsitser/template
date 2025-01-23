abstract interface class BaseToJsonModel {
  Map<String, dynamic> toJson();
}

abstract interface class BaseInitModel {
  Future<void> init();
}

abstract interface class BaseDisposeModel {
  Future<void> dispose();
}
