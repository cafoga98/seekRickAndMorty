import 'package:flutter/material.dart';
import 'package:seek_rickandmorty/core/design/helpers/handle_text.dart';
import 'package:seek_rickandmorty/core/design/tokens/colors.dart';

import '../tokens/styles_to_text.dart';

ThemeData customLightTheme(BuildContext context) => ThemeData(
      useMaterial3: true,
      primaryColor: MainColors.colorsCustom.portalGreen.color,
      splashColor: MainColors.colorsCustom.portalGreen.color,
      disabledColor: MainColors.background.disabled.color,
      hoverColor: MainColors.colorsCustom.toxicPurple.color,
      scaffoldBackgroundColor: MainColors.colorsCustom.white.color,
      textButtonTheme: TextButtonThemeData(
        style: primaryTextButtonTheme(context),
      ),
      outlinedButtonTheme: principalOutlinedButtonTheme(context),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return MainColors.background.disabled.color;
              }
              return MainColors.colorsCustom.rickBlue.color;
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return MainColors.colorsCustom.spaceshipGray.color;
              }
              return Colors.white;
            },
          ),
          overlayColor: MaterialStateProperty.all<Color>(
              MainColors.colorsCustom.portalDarkGreen.color),
          textStyle: MaterialStateProperty.all<TextStyle>(
            HandleTextStyle.label(context)
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      cardTheme: CardTheme(
        color: MainColors.colorsCustom.spaceshipGray.color,
        shadowColor: MainColors.colorsCustom.darkDimension.color,
        elevation: 2.5,
      ),
      dialogTheme: DialogTheme(
        backgroundColor: MainColors.colorsCustom.white.color,
        shadowColor: MainColors.colorsCustom.spaceshipGray.color,
        contentTextStyle: HandleTextStyle.body(context),
        titleTextStyle: HandleTextStyle.title(context),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: MainColors.colorsCustom.portalGreen.color,
        iconTheme: IconThemeData(
          color: MainColors.colorsCustom.white.color,
        ),
        titleTextStyle: HandleTextStyle.headline(context).copyWith(
          color: MainColors.colorsCustom.white.color,
        ),
      ),
    );

ThemeData customDarkTheme(BuildContext context) => ThemeData(
      textTheme: StandardTextTheme.textTheme(
        context,
        MainColors.colorsCustom.white.color,
      ),
      useMaterial3: true,
      primaryColor: MainColors.colorsCustom.portalDarkGreen.color,
      splashColor: MainColors.colorsCustom.portalGreen.color,
      scaffoldBackgroundColor: MainColors.colorsCustom.darkDimension.color,
      textButtonTheme: TextButtonThemeData(
        style: primaryTextButtonTheme(context),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
              MainColors.colorsCustom.white.color),
          overlayColor: MaterialStateProperty.all<Color>(
              MainColors.colorsCustom.spaceshipGray.color),
          textStyle: MaterialStateProperty.all<TextStyle>(
            HandleTextStyle.label(context)
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              MainColors.colorsCustom.portalGreen.color),
          foregroundColor: MaterialStateProperty.all<Color>(
              MainColors.colorsCustom.white.color),
          overlayColor: MaterialStateProperty.all<Color>(
              MainColors.colorsCustom.portalDarkGreen.color),
          textStyle: MaterialStateProperty.all<TextStyle>(
            HandleTextStyle.label(context)
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      cardTheme: CardTheme(
        color: MainColors.colorsCustom.spaceshipGray.color.withOpacity(0.9),
        shadowColor: MainColors.colorsCustom.white.color,
        elevation: 2.5,
      ),
      dialogTheme: DialogTheme(
        backgroundColor: Colors.black.withBlue(10),
        shadowColor:
            MainColors.colorsCustom.spaceshipGray.color.withOpacity(0.3),
        contentTextStyle: HandleTextStyle.body(context)
            .copyWith(color: MainColors.colorsCustom.white.color),
        titleTextStyle: HandleTextStyle.title(context)
            .copyWith(color: MainColors.colorsCustom.white.color),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: MainColors.colorsCustom.portalGreen.color,
        iconTheme: IconThemeData(color: MainColors.colorsCustom.white.color),
        titleTextStyle: HandleTextStyle.headline(context)
            .copyWith(color: MainColors.colorsCustom.white.color),
      ),
    );

OutlinedButtonThemeData principalOutlinedButtonTheme(BuildContext context) =>
    OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return MainColors.background.disabled.color;
            }
            return MainColors.colorsCustom.white.color;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return MainColors.colorsCustom.spaceshipGray.color;
            }
            return MainColors.colorsCustom.portalGreen.color;
          },
        ),
        overlayColor: MaterialStateProperty.all<Color>(
            MainColors.colorsCustom.toxicPurple.color),
        textStyle: MaterialStateProperty.all<TextStyle>(
          HandleTextStyle.label(context).copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );

ButtonStyle primaryTextButtonTheme(BuildContext context) => ButtonStyle(
      foregroundColor:
          MaterialStateProperty.all<Color>(MainColors.colorsCustom.white.color),
      overlayColor: MaterialStateProperty.all<Color>(
          MainColors.colorsCustom.portalGreen.color),
      textStyle: MaterialStateProperty.resolveWith<TextStyle>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return HandleTextStyle.body(context).copyWith(
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.overline,
              decorationColor: MainColors.colorsCustom.white.color,
              color: MainColors.colorsCustom.white.color,
            );
          }
          return HandleTextStyle.body(context).copyWith(
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
            decorationColor: MainColors.colorsCustom.white.color,
            color: MainColors.colorsCustom.white.color,
          );
        },
      ),
    );
