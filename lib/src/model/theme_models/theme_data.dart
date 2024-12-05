import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/theme/text/texts.dart';

/// The first problem of Material theme is that you don't build it from a predefined set of colors
/// So it's tempting to just copy paste the same colors everywhere
/// But it's not a good idea
/// Instead here we will only use the colors from our palette and stick with it.
/// And that's the same idea for the text theme.
/// If we want to change the font, we just change it in one place
///
/// I like to just set different colors to switch from light to dark theme
/// Using the same theme with just switching colors without redefining everything
///
/// Example of colors for white and black themes
/// | color label | Light theme | Dark theme |
/// | ----------- | ----------- | ---------- |
/// | primary     | #ED7225     | #ED7225    |
/// | surface     | #EDEAE5     | #0A0A0A    |
/// | onSurface   | #FFFFFF     | #161616    |
/// | error       | #E3442F     | #E3442F    |
class AppearanceKitThemeData {
  final AppearanceKitColors colors;
  final AppearanceKitTextTheme defaultTextTheme;
  final ThemeData materialTheme;

  const AppearanceKitThemeData({
    required this.colors,
    required this.defaultTextTheme,
    required this.materialTheme,
  });
}
