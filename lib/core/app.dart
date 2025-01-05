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
      ],
      child: BlocProvider(
        create: (context) => CharacterBloc(
          characterRepository: context.read<ICharacterRepository>(),
        ),
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
