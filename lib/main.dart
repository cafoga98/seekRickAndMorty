import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seek_rickandmorty/core/app.dart';
import 'package:seek_rickandmorty/core/config/di/injection.dart';
import 'package:seek_rickandmorty/core/config/flavors/environment_config.dart';

void shareMain(
  EnvironmentConfig environmentConfig,
) async {
  await DependencyInjectionConfig.init(
    environmentConfig: environmentConfig,
  );

  final instance = DependencyInjectionConfig.instance;

  runApp(MyApp(getIt: instance));
}
