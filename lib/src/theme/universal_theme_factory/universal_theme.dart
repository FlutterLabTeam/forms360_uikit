import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';

/// This is a uniform theme
/// But you can use it to create multiple themes for iOS, Android, Web, Desktop...
class UniversalThemeFactory extends AppearanceKitThemeDataFactory {
  const UniversalThemeFactory();

  @override
  AppearanceKitThemeData build({
    required AppearanceKitColors colors,
    required AppearanceKitTextTheme defaultTextStyle,
  }) {
    return AppearanceKitThemeData(
      colors: colors,
      defaultTextTheme: defaultTextStyle,
      materialTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: colors.primary).copyWith(
          error: colors.error,
          surface: colors.surface,
          primary: colors.primary,
          onSurface: colors.onSurface,
          onPrimary: colors.onPrimary,
        ),
        elevatedButtonTheme: elevatedButtonTheme(
          colors: colors,
          textTheme: defaultTextStyle,
        ),
        inputDecorationTheme: inputDecorationTheme(
          colors: colors,
          textTheme: defaultTextStyle,
        ),
        textTheme: textTheme(
          colors: colors,
          defaultTextStyle: defaultTextStyle,
        ),
        navigationRailTheme: navigationRailThemeData(
          colors: colors,
          textTheme: defaultTextStyle,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: colors.surface,
          foregroundColor: colors.onSurface,
          elevation: 0,
        ),
      ),
    );
  }

  NavigationRailThemeData navigationRailThemeData({
    required AppearanceKitColors colors,
    required AppearanceKitTextTheme textTheme,
  }) =>
      NavigationRailThemeData(
        elevation: 0,
        backgroundColor: colors.surface,
        selectedIconTheme: IconThemeData(color: colors.primary),
        unselectedIconTheme: IconThemeData(color: colors.grey2),
        selectedLabelTextStyle: textTheme.primary.copyWith(
          fontSize: 16,
          color: colors.primary,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelTextStyle: textTheme.primary.copyWith(
          fontSize: 16,
          color: colors.onSurface,
          fontWeight: FontWeight.w700,
        ),
      );

  ElevatedButtonThemeData elevatedButtonTheme({
    required AppearanceKitColors colors,
    required AppearanceKitTextTheme textTheme,
  }) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(200, 48),
          foregroundColor: colors.onPrimary,
          backgroundColor: colors.surface,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 2,
              color: colors.primary.withOpacity(.8),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: textTheme.primary.copyWith(
            fontSize: 16,
            color: colors.onPrimary,
            fontWeight: FontWeight.w700,
          ),
          elevation: 0,
        ),
      );

  InputDecorationTheme inputDecorationTheme({
    required AppearanceKitColors colors,
    required AppearanceKitTextTheme textTheme,
  }) =>
      InputDecorationTheme(
        fillColor: colors.surface,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: colors.grey1.withOpacity(.15)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: colors.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: colors.error, width: 2),
        ),
        filled: true,
        hintStyle: textTheme.primary.copyWith(
          fontSize: 16,
          color: colors.grey2,
          fontWeight: FontWeight.w300,
        ),
        labelStyle: textTheme.primary.copyWith(color: colors.grey2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: colors.grey2),
        ),
      );

  PageTransitionsTheme get pageTransitionsTheme => const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      );

  TextTheme textTheme({
    required AppearanceKitColors colors,
    required AppearanceKitTextTheme defaultTextStyle,
  }) =>
      TextTheme(
        headlineLarge: defaultTextStyle.primary.copyWith(
          fontSize: 32,
          color: colors.onPrimary,
          fontWeight: FontWeight.w700,
        ),
      );
}
