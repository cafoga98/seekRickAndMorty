import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:seek_rickandmorty/core/config/auto_route/router.dart';
import 'package:seek_rickandmorty/core/config/flavors/environment_config.dart';
import 'package:seek_rickandmorty/core/config/network/connectivity_checker.dart';
import 'package:seek_rickandmorty/core/config/network/gql_api_config.dart';
import 'package:seek_rickandmorty/core/config/network/graphql_client.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity_checker/connectivity_checker.dart';

class DependencyInjectionConfig {
  static final instance = GetIt.instance;

  static Future<void> init(
      {required EnvironmentConfig environmentConfig}) async {
    //region connectivityWrapper instance
    final connectivityWrapper = ConnectivityWrapper.instance;
    instance.registerSingleton<ConnectivityWrapper>(connectivityWrapper);
    //endregion

    //region EnvironmentConfig instance
    instance.registerSingleton<EnvironmentConfig>(environmentConfig);
    //endregion

    //region connectivityChecker instance
    final connectivityChecker = ConnectivityChecker(
      connectivity: instance<ConnectivityWrapper>(),
    );
    instance.registerLazySingleton<ConnectivityChecker>(
      () => connectivityChecker,
    );
    //endregion

    //region sharePreferences instance
    final sharePreferences = await SharedPreferences.getInstance();
    instance.registerSingleton<SharedPreferences>(sharePreferences);
    //endregion

    //region AppRouter instance
    instance.registerSingleton<AppRouter>(AppRouter());
    //endregion

    final graphClient =
    GraphQLClientConfig.getClient(instance<EnvironmentConfig>().apiBase);
    instance.registerSingleton<GraphQLClient>(graphClient);

    //region GraphQLApiConfig instance
    final graphQLApiConfig = GraphQLApiConfig(
      connectivityChecker: instance<ConnectivityChecker>(),
      client: instance<GraphQLClient>(),
    );
    instance.registerSingleton<GraphQLApiConfig>(graphQLApiConfig);
    //endregion
  }
}
