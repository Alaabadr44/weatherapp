import 'package:flutter_config/flutter_config.dart';

import '../../data/sources/api_source/api_key.dart';

Future<void> loadApiKeyFromEnvironmentVariables() async {
  await FlutterConfig.loadEnvVariables();
  apiKey = await FlutterConfig.get('api_key');
}
