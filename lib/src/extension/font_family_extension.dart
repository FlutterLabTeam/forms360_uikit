import 'package:forms360_uikit/src/model/font_family_type.dart';

extension FormTextStyleExtension on FontFamilyType {
  String toName() {
    switch (this) {
      case FontFamilyType.BE_VIETNAM:
        return "Be Vietnam";
    }
  }
}
