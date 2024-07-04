import 'package:flutter/material.dart';

import 'theme_helper.dart';


class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );
  static BoxDecoration get fillYellow => BoxDecoration(
        color: appTheme.yellow600,
      );

  // Gradient decorations
  static BoxDecoration get gradientYellowToWhiteA => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.56, 0.26),
          end: Alignment(0.56, 0.54),
          colors: [
            appTheme.yellow600,
            appTheme.whiteA700,
          ],
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder59 => BorderRadius.circular(
        59,
      );
  static BorderRadius get circleBorder81 => BorderRadius.circular(
        81,
      );

  // Custom borders
  static BorderRadius get customBorderBL20 => const BorderRadius.vertical(
        bottom: Radius.circular(20),
      );

  // Rounded borders
  static BorderRadius get roundedBorder25 => BorderRadius.circular(
        25,
      );
  static BorderRadius get roundedBorder43 => BorderRadius.circular(
        43,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
