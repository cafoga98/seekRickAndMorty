import 'package:flutter/material.dart';

class ColorsType {
  final String category;
  final Color color;

  const ColorsType._(this.category, this.color);
}

class MainColors {
  MainColors._();

  static ColorsCustom colorsCustom = const ColorsCustom();
  static Background background = const Background();
}

class ColorsCustom {
  const ColorsCustom();

  final ColorsType white =
  const ColorsType._('ColorsCustom', Color(0xFFFFFFFF));
  final ColorsType portalGreen =
  const ColorsType._('ColorsCustom', Color(0xFF00FF6D)); // Verde portal
  final ColorsType portalDarkGreen =
  const ColorsType._('ColorsCustom', Color(0xFF008F44)); // Verde oscuro del portal
  final ColorsType mortyYellow =
  const ColorsType._('ColorsCustom', Color(0xFFFFD93D)); // Amarillo Morty
  final ColorsType rickBlue =
  const ColorsType._('ColorsCustom', Color(0xFF3A86FF)); // Azul Rick
  final ColorsType spaceshipGray =
  const ColorsType._('ColorsCustom', Color(0xFF4D5B64)); // Gris nave espacial
  final ColorsType toxicPurple =
  const ColorsType._('ColorsCustom', Color(0xFF9C1DE7)); // Morado tóxico
  final ColorsType darkDimension =
  const ColorsType._('ColorsCustom', Color(0xFF1A1A2E)); // Fondo oscuro
  final ColorsType accentPink =
  const ColorsType._('ColorsCustom', Color(0xFFFF4081)); // Rosa acentuado
}

class Background {
  const Background();

  final ColorsType disabled =
  const ColorsType._('Background', Color(0xFFAEB3BC)); // Gris deshabilitado
}
