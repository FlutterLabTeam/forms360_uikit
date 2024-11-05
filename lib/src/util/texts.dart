import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/model/font_family_type.dart';
import 'package:forms360_uikit/src/extension/font_family_extension.dart';

class FormsTextStyle {
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
        fontSize: 20,
        fontWeight: FontWeight.w300,
        fontFamily: FontFamilyType.BE_VIETNAM.toName(),
      );

  /// BASE
  final TextStyle _baseTextStyle = TextStyle(
    color: Color(0xFF000000),
    fontWeight: FontWeight.normal,
  );
}
