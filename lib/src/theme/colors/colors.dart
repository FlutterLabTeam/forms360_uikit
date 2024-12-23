import 'package:flutter/material.dart';

class AppearanceKitColors extends ThemeExtension<AppearanceKitColors> {
  final Color error;
  final Color primary;
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
    required this.surface,
    required this.onPrimary,
    required this.onSurface,
    required this.secondary,
    required this.surfaceContainer,
  });

  factory AppearanceKitColors.light() => const AppearanceKitColors(
        grey1: Color(0xFFA3B2BC),
        grey2: Color(0xFF7D8488),
        grey3: Color(0xFF263238),
        error: Color(0xFFCF6679),
        primary: Color(0xFF1e5c8b),
        surface: Color(0xffffffff),
        onPrimary: Color(0xFF132248),
        onSurface: Color(0xFFcbeef3),
        secondary: Color(0xFF4cae50),
        surfaceContainer: Color(0xFFDEEAF4),
      );

  factory AppearanceKitColors.dark() => const AppearanceKitColors(
        error: Color(0xFFCF6679),
        surface: Color(0xFF161616),
        primary: Color(0xFF1E88E5),
        onPrimary: Color(0xFF1e5c8b),
        secondary: Color(0xFFFFFFFF),
        surfaceContainer: Color(0xFF0A0A0A),
        onSurface: Color(0xFFFFFFFF),
        grey1: Color(0xFF263238),
        grey2: Color(0xFF7D8488),
        grey3: Color(0xFFBEC1C3),
      );

  @override
  ThemeExtension<AppearanceKitColors> copyWith({
    Color? error,
    Color? primary,
    Color? surface,
    Color? onPrimary,
    Color? onSurface,
    Color? secondary,
    Color? surfaceContainer,
    Color? grey1,
    Color? grey2,
    Color? grey3,
  }) {
    return AppearanceKitColors(
      error: error ?? this.error,
      primary: primary ?? this.primary,
      surface: surface ?? this.surface,
      secondary: secondary ?? this.secondary,
      onPrimary: onPrimary ?? this.onPrimary,
      onSurface: onSurface ?? this.onSurface,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      grey1: grey1 ?? this.grey1,
      grey2: grey2 ?? this.grey2,
      grey3: grey3 ?? this.grey3,
    );
  }

  @override
  ThemeExtension<AppearanceKitColors> lerp(
    covariant ThemeExtension<AppearanceKitColors>? other,
    double t,
  ) {
    if (other == null || other is! AppearanceKitColors) return this;

    return AppearanceKitColors(
      error: Color.lerp(error, other.error, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
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
