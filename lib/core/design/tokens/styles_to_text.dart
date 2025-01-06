import 'package:flutter/material.dart';
import 'package:seek_rickandmorty/core/design/tokens/typography.dart';

/// | NAME           | SIZE |  WEIGHT | LETTER SPACING |  TYPOGRAPHY  |
/// |----------------|------|---------|----------------|--------------|
/// | displayLarge   | 57.0 | light   |    -0.25       | familyRoboto |
/// | displayMedium  | 45.0 | light   |     0.0        | familyRoboto |
/// | displaySmall   | 36.0 | light   |     0.0        | familyRoboto |
/// | headlineLarge  | 32.0 | light   |     0.0        | familyRoboto |
/// | headlineMedium | 28.0 | light   |     0.0        | familyRoboto |
/// | headlineSmall  | 24.0 | light   |     0.0        | familyRoboto |
/// | titleLarge     | 22.0 | bold    |     0.0        | familyRoboto |
/// | titleMedium    | 16.0 | bold    |     0.15       | familyRoboto |
/// | titleSmall     | 14.0 | bold    |     0.1        | familyRoboto |
/// | bodyLarge      | 16.0 | light   |     0.1        | familyRoboto |
/// | bodyMedium     | 14.0 | light   |     0.25       | familyRoboto |
/// | bodySmall      | 12.0 | light   |     0.4        | familyRoboto |
/// | labelLarge     | 14.0 | medium  |     0.1        | familyRoboto |
/// | labelMedium    | 12.0 | medium  |     0.5        | familyRoboto |
/// | labelSmall     | 11.0 | medium  |     0.5        | familyRoboto |

/// ...where "light" is `FontWeight.w400`, "medium" is `FontWeight.w500` and "bold" is `FontWeight.w700`.

class StandardTextTheme {
  static TextTheme textTheme(BuildContext context, Color textColor) =>
      TextTheme(
        //region Display Theme
        displayLarge: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontFamily: CustomTypography.familySignikaNegative,
              color: textColor,
            ),
        displayMedium: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontFamily: CustomTypography.familySignikaNegative,
              color: textColor,
            ),
        displaySmall: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontFamily: CustomTypography.familySignikaNegative,
              color: textColor,
            ),
        //endregion
        //region Headline Theme
        headlineLarge: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontFamily: CustomTypography.familySignikaNegative,
              color: textColor,
            ),
        headlineMedium: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontFamily: CustomTypography.familySignikaNegative,
              color: textColor,
            ),
        headlineSmall: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontFamily: CustomTypography.familySignikaNegative,
              color: textColor,
            ),
        //endregion
        //region Title Theme
        titleLarge: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontFamily: CustomTypography.familySignikaNegative,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
        titleMedium: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontFamily: CustomTypography.familySignikaNegative,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
        titleSmall: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontFamily: CustomTypography.familySignikaNegative,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
        //endregion
        //region Label Theme
        labelLarge: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontFamily: CustomTypography.familySignikaNegative,
              color: textColor,
            ),
        labelMedium: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontFamily: CustomTypography.familySignikaNegative,
              color: textColor,
            ),
        labelSmall: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontFamily: CustomTypography.familySignikaNegative,
              color: textColor,
            ),
        //endregion
        //region Body Theme
        bodyLarge: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontFamily: CustomTypography.familySignikaNegative,
              color: textColor,
            ),
        bodyMedium: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontFamily: CustomTypography.familySignikaNegative,
              color: textColor,
            ),
        bodySmall: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontFamily: CustomTypography.familySignikaNegative,
              color: textColor,
            ),
        //endregion
      );
}
