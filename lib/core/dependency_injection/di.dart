
import 'package:fixly/core/network/gemini/service_providers_database.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

  void setup() {
    getIt.registerLazySingleton(() => ServiceProvidersDatabase().getProviders(service: getIt()));
  }