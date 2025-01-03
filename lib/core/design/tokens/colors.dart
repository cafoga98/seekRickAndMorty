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
  static GrayScale grayScale = const GrayScale();
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

  final ColorsType primary =
  const ColorsType._('Background', Color(0xFF1A1A2E)); // Fondo oscuro
  final ColorsType disabled =
  const ColorsType._('Background', Color(0xFFAEB3BC)); // Gris deshabilitado
  final ColorsType success =
  const ColorsType._('Background', Color(0xFFD6FFE5)); // Fondo verde claro
  final ColorsType warning =
  const ColorsType._('Background', Color(0xFFFFF6D6)); // Fondo amarillo claro
  final ColorsType error =
  const ColorsType._('Background', Color(0xFFFFE5E5)); // Fondo rosa claro
  final ColorsType main =
  const ColorsType._('Background', Color(0xFFF7F7F7)); // Fondo blanco
}

class GrayScale {
  const GrayScale();

  final ColorsType white =
  const ColorsType._('GrayScale', Color(0xFFFFFFFF)); // Blanco puro
  final ColorsType gray100 =
  const ColorsType._('GrayScale', Color(0xFFF3F4F5)); // Gris muy claro
  final ColorsType gray200 =
  const ColorsType._('GrayScale', Color(0xFFD0D4D9)); // Gris claro
  final ColorsType gray300 =
  const ColorsType._('GrayScale', Color(0xFFAEB3BC)); // Gris medio
  final ColorsType gray400 =
  const ColorsType._('GrayScale', Color(0xFF7B8493)); // Gris oscuro
  final ColorsType gray500 =
  const ColorsType._('GrayScale', Color(0xFF4D5B64)); // Gris más oscuro
  final ColorsType gray600 =
  const ColorsType._('GrayScale', Color(0xFF2A2E34)); // Gris casi negro
}
