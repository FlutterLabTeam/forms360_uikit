import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/extension/font_family_extension.dart';

class AppearanceKitTextTheme extends ThemeExtension<AppearanceKitTextTheme> {
  final TextStyle input;
  final TextStyle button;
  final TextStyle primary;
  final TextStyle secondary;

  const AppearanceKitTextTheme({
    required this.input,
    required this.button,
    required this.primary,
    required this.secondary,
  });

  factory AppearanceKitTextTheme.build() => AppearanceKitTextTheme(
        button: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        input: TextStyle(
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
  }) =>
      AppearanceKitTextTheme(
        input: input ?? this.input,
        button: button ?? this.button,
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
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
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/model/font_family_type.dart';
import 'package:forms360_uikit/src/extension/font_family_extension.dart';
import 'package:forms360_uikit/src/util/ui_color.dart';

class FormsTextStyle {
  TextStyle get title => _baseTextStyle.copyWith(
        fontSize: 50,
        color: UiColor().blue,
        fontWeight: FontWeight.w500,
        fontFamily: FontFamilyType.BE_VIETNAM.toName(),
      );

  TextStyle get primary => _baseTextStyle.copyWith(
        fontSize: 40,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamilyType.BE_VIETNAM.toName(),
      );

  TextStyle get button => _baseTextStyle.copyWith(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      );

  TextStyle get secondary => _baseTextStyle.copyWith(
        fontSize: 20,
        color: Color.fromARGB(255, 0, 52, 124),
        fontFamily: FontFamilyType.BE_VIETNAM.toName(),
      );

  TextStyle get input => _baseTextStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        fontFamily: FontFamilyType.BE_VIETNAM.toName(),
      );

  /// BASE
  final TextStyle _baseTextStyle = TextStyle(
    color: Color(0xFF000000),
    fontWeight: FontWeight.normal,
  );
}
*/
