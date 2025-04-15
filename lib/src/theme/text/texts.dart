import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/theme/colors/color_palette.dart';
import 'package:forms360_uikit/src/theme/text/text_constants.dart';

class AppearanceKitTextTheme extends ThemeExtension<AppearanceKitTextTheme> {
  final TextStyle input;
  final TextStyle title;
  final TextStyle button;
  final TextStyle primary;
  final TextStyle secondary;
  final TextStyle description;
  final TextStyle smallDescription;
  final TextStyle link;
  final TextStyle large;

  const AppearanceKitTextTheme({
    required this.input,
    required this.title,
    required this.button,
    required this.primary,
    required this.secondary,
    required this.description,
    required this.smallDescription,
    required this.link,
    required this.large,
  });

  factory AppearanceKitTextTheme.build() => AppearanceKitTextTheme(
        smallDescription: TextStyle(
          fontWeight: FontWeight.w300,
          color: ColorPalette.onSurface,
          fontSize: TextConstants.fontSizeS,
          height: TextConstants.lineHeightNormal,
          fontFamily: FontFamilyType.BE_VIETNAM.toName(),
          letterSpacing: TextConstants.letterSpacingNormal,
        ),
        button: TextStyle(
          fontWeight: FontWeight.w600,
          color: ColorPalette.onSurface,
          fontSize: TextConstants.fontSizeM,
          height: TextConstants.lineHeightNormal,
          fontFamily: FontFamilyType.BE_VIETNAM.toName(),
          letterSpacing: TextConstants.letterSpacingWide,
        ),
        input: TextStyle(
          fontWeight: FontWeight.w300,
          color: ColorPalette.onSurface,
          fontSize: TextConstants.fontSizeM,
          height: 0 /* TextConstants.lineHeightNormal */,
          fontFamily: FontFamilyType.BE_VIETNAM.toName(),
          letterSpacing: TextConstants.letterSpacingNormal,
        ),
        description: TextStyle(
          fontWeight: FontWeight.w300,
          color: ColorPalette.onSurface,
          fontSize: TextConstants.fontSizeM,
          height: TextConstants.lineHeightLoose,
          fontFamily: FontFamilyType.BE_VIETNAM.toName(),
          letterSpacing: TextConstants.letterSpacingNormal,
        ),
        primary: TextStyle(
          fontWeight: FontWeight.w500,
          color: ColorPalette.onSurface,
          fontSize: TextConstants.fontSizeXXL,
          height: TextConstants.lineHeightTight,
          fontFamily: FontFamilyType.BE_VIETNAM.toName(),
          letterSpacing: TextConstants.letterSpacingTight,
        ),
        title: TextStyle(
          wordSpacing: 0,
          fontWeight: FontWeight.w500,
          color: ColorPalette.onSurface,
          fontSize: TextConstants.fontSizeTitle,
          height: TextConstants.lineHeightTight,
          fontFamily: FontFamilyType.BE_VIETNAM.toName(),
          letterSpacing: TextConstants.letterSpacingXTight,
        ),
        secondary: TextStyle(
          fontWeight: FontWeight.w400,
          color: ColorPalette.onSurface,
          fontSize: TextConstants.fontSizeL,
          height: TextConstants.lineHeightNormal,
          fontFamily: FontFamilyType.BE_VIETNAM.toName(),
          letterSpacing: TextConstants.letterSpacingNormal,
        ),
        link: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: TextConstants.fontSizeS,
          color: ColorPalette.primaryLight,
          height: TextConstants.lineHeightNormal,
          fontFamily: FontFamilyType.BE_VIETNAM.toName(),
          letterSpacing: TextConstants.letterSpacingNormal,
        ),
        large: TextStyle(
          fontWeight: FontWeight.w500,
          color: ColorPalette.onSurface,
          fontSize: TextConstants.fontSizeXXXL,
          height: TextConstants.lineHeightNormal,
          fontFamily: FontFamilyType.BE_VIETNAM.toName(),
          letterSpacing: TextConstants.letterSpacingNormal,
        ),
      );

  @override
  ThemeExtension<AppearanceKitTextTheme> copyWith({
    TextStyle? input,
    TextStyle? title,
    TextStyle? button,
    TextStyle? primary,
    TextStyle? secondary,
    TextStyle? description,
    TextStyle? smallDescription,
    TextStyle? link,
    TextStyle? large,
  }) =>
      AppearanceKitTextTheme(
        input: input ?? this.input,
        title: title ?? this.title,
        button: button ?? this.button,
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        description: description ?? this.description,
        smallDescription: smallDescription ?? this.smallDescription,
        link: link ?? this.link,
        large: large ?? this.large,
      );

  @override
  ThemeExtension<AppearanceKitTextTheme> lerp(
    covariant ThemeExtension<AppearanceKitTextTheme>? other,
    double t,
  ) {
    if (other is! AppearanceKitTextTheme) return this;

    return AppearanceKitTextTheme(
      title: TextStyle.lerp(title, other.title, t)!,
      input: TextStyle.lerp(input, other.input, t)!,
      button: TextStyle.lerp(button, other.button, t)!,
      primary: TextStyle.lerp(primary, other.primary, t)!,
      secondary: TextStyle.lerp(secondary, other.secondary, t)!,
      description: TextStyle.lerp(description, other.description, t)!,
      smallDescription:
          TextStyle.lerp(smallDescription, other.smallDescription, t)!,
      link: TextStyle.lerp(link, other.link, t)!,
      large: TextStyle.lerp(large, other.large, t)!,
    );
  }
}
