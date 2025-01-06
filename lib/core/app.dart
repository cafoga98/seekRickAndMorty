import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get_it/get_it.dart';
import 'package:seek_rickandmorty/core/config/auto_route/router.dart';
import 'package:seek_rickandmorty/core/config/network/gql_api_config.dart';
import 'package:seek_rickandmorty/core/design/themes/main_theme.dart';
import 'package:seek_rickandmorty/features/characters/data/repositories/character_repository.dart';
import 'package:seek_rickandmorty/features/characters/data/repositories/i_character_repository.dart';
import 'package:seek_rickandmorty/features/characters/data/services/character_service.dart';
import 'package:seek_rickandmorty/features/characters/data/services/i_character_service.dart';
import 'package:seek_rickandmorty/features/characters/domain/blocs/character_bloc/character_bloc.dart';
import 'package:seek_rickandmorty/features/episodes/data/repositories/episode_repository.dart';
import 'package:seek_rickandmorty/features/episodes/data/repositories/i_episode_repository.dart';
import 'package:seek_rickandmorty/features/episodes/data/services/episode_service.dart';
import 'package:seek_rickandmorty/features/episodes/data/services/i_episode_service.dart';
import 'package:seek_rickandmorty/features/episodes/domain/bloc/episode_bloc/episode_bloc.dart';
import 'package:seek_rickandmorty/features/locations/data/repositories/i_location_repository.dart';
import 'package:seek_rickandmorty/features/locations/data/repositories/location_repository.dart';
import 'package:seek_rickandmorty/features/locations/data/services/i_location_service.dart';
import 'package:seek_rickandmorty/features/locations/data/services/location_service.dart';
import 'package:seek_rickandmorty/features/locations/domain/bloc/location_bloc/location_bloc.dart';
import 'package:seek_rickandmorty/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatefulWidget {
  final GetIt getIt;

  const MyApp({
    super.key,
    required this.getIt,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ICharacterService>(
          create: (context) => CharacterService(
            apiConfig: widget.getIt<GraphQLApiConfig>(),
          ),
        ),
        RepositoryProvider<ICharacterRepository>(
          create: (context) => CharacterRepository(
            characterService: context.read<ICharacterService>(),
          ),
        ),
        RepositoryProvider<IEpisodeService>(
            create: (context) => EpisodeService(
                  apiConfig: widget.getIt<GraphQLApiConfig>(),
                )),
        RepositoryProvider<IEpisodeRepository>(
          create: (context) => EpisodeRepository(
            episodeService: context.read<IEpisodeService>(),
          ),
        ),
        RepositoryProvider<ILocationService>(
          create: (context) => LocationService(
            apiConfig: widget.getIt<GraphQLApiConfig>(),
          ),
        ),
        RepositoryProvider<ILocationRepository>(
          create: (context) => LocationRepository(
            locationService: context.read<ILocationService>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CharacterBloc(
              characterRepository: context.read<ICharacterRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => EpisodeBloc(
              episodeRepository: context.read<IEpisodeRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => LocationBloc(
              locationRepository: context.read<ILocationRepository>(),
            ),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: customDarkTheme(context),
          routeInformationParser:
              widget.getIt<AppRouter>().defaultRouteParser(),
          routerDelegate: widget.getIt<AppRouter>().delegate(),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          builder: (context, child) {
            final mediaQuery = MediaQuery.of(context);
            return Builder(
              builder: (context) => MediaQuery(
                data: mediaQuery,
                child: child!,
              ),
            );
          },
        ),
      ),
    );
  }
}
