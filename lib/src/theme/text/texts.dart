import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';

class AppearanceKitTextTheme extends ThemeExtension<AppearanceKitTextTheme> {
  final TextStyle input;
  final TextStyle button;
  final TextStyle primary;
  final TextStyle secondary;
  final TextStyle description;
  final TextStyle smallDescription;

  const AppearanceKitTextTheme({
    required this.input,
    required this.button,
    required this.primary,
    required this.secondary,
    required this.description,
    required this.smallDescription,
  });

  factory AppearanceKitTextTheme.build() => AppearanceKitTextTheme(
        smallDescription: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w300,
          fontFamily: FontFamilyType.BE_VIETNAM.toName(),
        ),
        button: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontFamily: FontFamilyType.BE_VIETNAM.toName(),
        ),
        input: TextStyle(
          fontSize: 16,
          color: Color(0xFF000000),
          fontWeight: FontWeight.w300,
          fontFamily: FontFamilyType.BE_VIETNAM.toName(),
        ),
        description: TextStyle(
          fontSize: 16,
          color: Color(0xFF000000),
          fontWeight: FontWeight.w300,
          fontFamily: FontFamilyType.BE_VIETNAM.toName(),
        ),
        primary: TextStyle(
          fontSize: 40,
          color: Color(0xFF000000),
          fontWeight: FontWeight.w400,
          fontFamily: FontFamilyType.BE_VIETNAM.toName(),
        ),
        secondary: TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 0, 52, 124),
          fontFamily: FontFamilyType.BE_VIETNAM.toName(),
        ),
      );

  @override
  ThemeExtension<AppearanceKitTextTheme> copyWith({
    TextStyle? input,
    TextStyle? button,
    TextStyle? primary,
    TextStyle? secondary,
    TextStyle? description,
    TextStyle? smallDescription,
  }) =>
      AppearanceKitTextTheme(
        input: input ?? this.input,
        button: button ?? this.button,
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        description: description ?? this.description,
        smallDescription: smallDescription ?? this.smallDescription,
      );

  @override
  ThemeExtension<AppearanceKitTextTheme> lerp(
    covariant ThemeExtension<AppearanceKitTextTheme>? other,
    double t,
  ) {
    if (other is! AppearanceKitTextTheme) return this;

    return AppearanceKitTextTheme(
      input: TextStyle.lerp(input, other.input, t)!,
      button: TextStyle.lerp(button, other.button, t)!,
      primary: TextStyle.lerp(primary, other.primary, t)!,
      secondary: TextStyle.lerp(secondary, other.secondary, t)!,
      description: TextStyle.lerp(description, other.description, t)!,
      smallDescription: TextStyle.lerp(smallDescription, other.smallDescription, t)!,
    );
  }
}