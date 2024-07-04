import 'package:flutter/material.dart';

import 'theme_helper.dart';



/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  static get displayMedium40 => theme.textTheme.displayMedium!.copyWith(
        fontSize: 40,
      );
  static get displayMediumPrimary => theme.textTheme.displayMedium!.copyWith(

        color: theme.colorScheme.primary.withOpacity(1),
        fontSize: 40,
      );
  // Headline style
  static get headlineLargeAtkinsonHyperlegible =>
      theme.textTheme.headlineLarge!.atkinsonHyperlegible;
  static get headlineLargeAtkinsonHyperlegiblePrimary =>
      theme.textTheme.headlineLarge!.atkinsonHyperlegible.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
      );
  static get headlineLargeWhiteA700 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 30,
        fontWeight: FontWeight.w500,
      );
  static get headlineMediumAtkinsonHyperlegiblePrimary =>
      theme.textTheme.headlineMedium!.atkinsonHyperlegible.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontSize: 26,
        fontWeight: FontWeight.w700,
      );
  static get headlineMediumPrimaryContainer =>
      theme.textTheme.headlineMedium!.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 26,
        fontWeight: FontWeight.w700,
      );
  static get headlineMediumWhiteA700 =>
      theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get headlineSmallAtma => theme.textTheme.headlineSmall!.atma.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get headlineSmallAtmaRedA200 =>
      theme.textTheme.headlineSmall!.atma.copyWith(
        color: appTheme.redA200,
      );
  static get headlineSmallBluegray100 =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.blueGray100,
        fontWeight: FontWeight.w400,
      );
  static get headlineSmallPrimary => theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontWeight: FontWeight.w400,
      );
  static get headlineSmallPrimaryContainer =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get headlineSmallRed500 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.red500,
      );
}

extension on TextStyle {
  TextStyle get atkinsonHyperlegible {
    return copyWith(
      fontFamily: 'Atkinson Hyperlegible',
    );
  }

  TextStyle get atma {
    return copyWith(
      fontFamily: 'Atma',
    );
  }
}
