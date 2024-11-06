import 'package:forms360_uikit/src/theme/index_theme.dart';
import 'package:forms360_uikit/src/widgets/index_widget.dart';

//models
export 'package:forms360_uikit/src/model/input_types.dart';
export 'package:forms360_uikit/src/model/button_type.dart';
export 'package:forms360_uikit/src/model/font_family_type.dart';
export 'package:forms360_uikit/src/model/theme_models/theme_data.dart';
export 'package:forms360_uikit/src/model/theme_models/theme_data_factory.dart';

// theme
export 'package:forms360_uikit/src/theme/text/texts.dart';
export 'package:forms360_uikit/src/theme/colors/colors.dart';
export 'package:forms360_uikit/src/theme/universal_theme_factory/universal_theme.dart';




//abstract class
class FormsKit {
  static Theme theme = Theme();
  static UiWidget widget = UiWidget();
}
