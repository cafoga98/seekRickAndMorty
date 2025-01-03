import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:seek_rickandmorty/core/config/flavors/environment_config.dart';
import 'package:seek_rickandmorty/main.dart';


void main() {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: '.env.dev');
    final flavorConfig = EnvironmentConfig(
      environment: EnvironmentType.development.env,
      apiBase: dotenv.env['API_BASE']!,
    );
    shareMain(flavorConfig);
  }, (onError, stack) {
    throw 'main.dev Error ($onError)';
  });
}
