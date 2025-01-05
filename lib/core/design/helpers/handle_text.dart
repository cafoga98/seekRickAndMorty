import 'package:flutter/material.dart';

class HandleTextStyle {
  /// Method to determine the appropriate "Title" text style
  /// based on the screen width (tablet or phone).
  /// Example: Use this for titles like in a form or a section heading.
  static TextStyle title(BuildContext context) {
    /// Get the screen width using MediaQuery.

    return Theme.of(context).textTheme.titleLarge!;
  }

  /// Method to determine the appropriate "Display" text style
  /// based on the screen width.
  /// Example: Use this for large titles or banners on a homepage or welcome screen.
  static TextStyle display(BuildContext context) {
    /// Get the screen width using MediaQuery.
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 600) {
      /// For larger screens like tablets, use the 'displayLarge' style.
      return Theme.of(context).textTheme.displayLarge!;
    } else {
      /// For smaller screens like phones, use the 'displaySmall' style.
      return Theme.of(context).textTheme.displaySmall!;
    }
  }

  /// Method to determine the appropriate "Headline" text style
  /// based on the screen width.
  /// Example: Use this for headlines like the title of an article or news.
  static TextStyle headline(BuildContext context) {
    /// Get the screen width using MediaQuery.
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 600) {
      /// For larger screens like tablets, use the 'headlineLarge' style.
      return Theme.of(context).textTheme.headlineLarge!;
    } else {
      /// For smaller screens like phones, use the 'headlineSmall' style.
      return Theme.of(context).textTheme.headlineSmall!;
    }
  }

  /// Method to determine the appropriate "Label" text style
  /// based on the screen width.
  /// Example: Use this for buttons, chips, badges or small labels.
  static TextStyle label(BuildContext context) {
    /// Get the screen width using MediaQuery.
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 600) {
      /// For larger screens like tablets, use the 'labelLarge' style.
      return Theme.of(context).textTheme.labelLarge!;
    } else {
      /// For smaller screens like phones, use the 'labelMedium' style.
      return Theme.of(context).textTheme.labelMedium!;
    }
  }

  /// Method to determine the appropriate "Body" text style
  /// based on the screen width.
  /// Example: Use this for regular body text in articles or content sections.
  static TextStyle body(BuildContext context) {
    /// Get the screen width using MediaQuery.
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 600) {
      /// For larger screens like tablets, use the 'bodyLarge' style.
      return Theme.of(context).textTheme.bodyLarge!;
    } else {
      /// For smaller screens like phones, use the 'bodyMedium' style.
      return Theme.of(context).textTheme.bodyMedium!;
    }
  }
}
