import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/extension/font_family_extension.dart';
import 'package:forms360_uikit/src/model/font_family_type.dart';

extension FormTextStyleExtension on TextStyle {
  TextStyle get BE_VIETNAM_FAMILY => copyWith(
        fontFamily: FontFamilyType.BE_VIETNAM.toName(),
      );
}
