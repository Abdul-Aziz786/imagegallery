import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env.dev', obfuscate: true, name: 'EnvDev')
abstract class EnvDev {
  @EnviedField(varName: 'API_BASE_URL', obfuscate: true)
  static final String apiBaseUrl = _EnvDev.apiBaseUrl;

  @EnviedField(varName: 'API_KEY', obfuscate: true)
  static final String apiKey = _EnvDev.apiKey;

  @EnviedField(varName: 'ENVIRONMENT', obfuscate: false)
  static final String environment = _EnvDev.environment;
}

abstract class Env {
  static String get apiBaseUrl => EnvDev.apiBaseUrl;
  static String get apiKey => EnvDev.apiKey;
  static String get environment => EnvDev.environment;
}
