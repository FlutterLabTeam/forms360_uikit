import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/theme/colors/color_palette.dart';

class AppearanceKitColors extends ThemeExtension<AppearanceKitColors> {
  final Color error;
  final Color primary;
  final Color primaryLight;
  final Color surface;
  final Color onPrimary;
  final Color secondary;
  final Color onSurface;
  final Color surfaceContainer;

  final Color grey1;
  final Color grey2;
  final Color grey3;

  const AppearanceKitColors({
    required this.grey1,
    required this.grey2,
    required this.grey3,
    required this.error,
    required this.primary,
    required this.primaryLight,
    required this.surface,
    required this.onPrimary,
    required this.onSurface,
    required this.secondary,
    required this.surfaceContainer,
  });

  factory AppearanceKitColors.light() => const AppearanceKitColors(
        grey1: ColorPalette.grey1,
        grey2: ColorPalette.grey2,
        grey3: ColorPalette.grey3,
        error: ColorPalette.error,
        primary: ColorPalette.primary,
        primaryLight: ColorPalette.primaryLight,
        surface: ColorPalette.surface,
        onPrimary: ColorPalette.onPrimary,
        onSurface: ColorPalette.onSurface,
        secondary: ColorPalette.secondary, 
        surfaceContainer: ColorPalette.surfaceContainer,
      );

  factory AppearanceKitColors.dark() => const AppearanceKitColors(
        error: ColorPalette.error,
        surface: ColorPalette.surfaceDark,
        primary: ColorPalette.primaryLight,
        primaryLight: ColorPalette.primaryLight,
        onPrimary: ColorPalette.onPrimary,
        secondary: ColorPalette.secondaryLight,
        surfaceContainer: ColorPalette.surfaceContainerDark,
        onSurface: ColorPalette.onSurfaceDark,
        grey1: ColorPalette.grey3,
        grey2: ColorPalette.grey2,
        grey3: ColorPalette.grey1,
      );

  @override
  ThemeExtension<AppearanceKitColors> copyWith({
    Color? error,
    Color? primary,
    Color? primaryLight,
    Color? surface,
    Color? onPrimary,
    Color? onSurface,
    Color? secondary,
    Color? surfaceContainer,
    Color? grey1,
    Color? grey2,
    Color? grey3,
  }) =>
      AppearanceKitColors(
        error: error ?? this.error,
        primary: primary ?? this.primary,
        primaryLight: primaryLight ?? this.primaryLight,
        surface: surface ?? this.surface,
        secondary: secondary ?? this.secondary,
        onPrimary: onPrimary ?? this.onPrimary,
        onSurface: onSurface ?? this.onSurface,
        surfaceContainer: surfaceContainer ?? this.surfaceContainer,
        grey1: grey1 ?? this.grey1,
        grey2: grey2 ?? this.grey2,
        grey3: grey3 ?? this.grey3,
      );

  @override
  ThemeExtension<AppearanceKitColors> lerp(
    covariant ThemeExtension<AppearanceKitColors>? other,
    double t,
  ) {
    if (other == null || other is! AppearanceKitColors) return this;

    return AppearanceKitColors(
      error: Color.lerp(error, other.error, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      primaryLight: Color.lerp(primaryLight, other.primaryLight, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      surfaceContainer:
          Color.lerp(surfaceContainer, other.surfaceContainer, t)!,
      grey1: Color.lerp(grey1, other.grey1, t)!,
      grey2: Color.lerp(grey2, other.grey2, t)!,
      grey3: Color.lerp(grey3, other.grey3, t)!,
    );
  }
}
