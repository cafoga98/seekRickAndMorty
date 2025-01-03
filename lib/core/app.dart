import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get_it/get_it.dart';
import 'package:seek_rickandmorty/core/config/auto_route/router.dart';
import 'package:seek_rickandmorty/core/design/themes/main_theme.dart';
import 'package:seek_rickandmorty/generated/l10n.dart';

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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: customLightTheme(context),
      darkTheme: customDarkTheme(context),
      routeInformationParser: widget.getIt<AppRouter>().defaultRouteParser(),
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
            data: mediaQuery.copyWith(
              textScaler: TextScaler.noScaling,
            ),
            child: child!,
          ),
        );
      },
    );
  }
}
