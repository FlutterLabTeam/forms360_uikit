import 'package:forms360_uikit/src/theme/index_theme.dart';
import 'package:forms360_uikit/src/widgets/index_widget.dart';

//models
export 'package:forms360_uikit/src/model/input_types.dart';
export 'package:forms360_uikit/src/model/button_type.dart';
export 'package:forms360_uikit/src/model/pop_up_model.dart';
export 'package:forms360_uikit/src/model/tag_model.dart';

export 'package:forms360_uikit/src/model/permission_type.dart';
export 'package:forms360_uikit/src/model/font_family_type.dart';
export 'package:forms360_uikit/src/model/menu_item_type_type.dart';
export 'package:forms360_uikit/src/model/theme_models/theme_data.dart';
export 'package:forms360_uikit/src/model/theme_models/theme_data_factory.dart';

// theme
export 'package:forms360_uikit/src/theme/text/texts.dart';
export 'package:forms360_uikit/src/theme/colors/colors.dart';
export 'package:forms360_uikit/src/theme/universal_theme_factory/universal_theme.dart';

//extension
export 'package:forms360_uikit/src/extension/widget_extension.dart';
export 'package:forms360_uikit/src/extension/context_extension.dart';
export 'package:forms360_uikit/src/extension/permission_extension.dart';
export 'package:forms360_uikit/src/extension/font_family_extension.dart';
export 'package:forms360_uikit/src/extension/validation_extension.dart';

//widget
export 'package:forms360_uikit/src/widgets/menu/menu_icon.dart';

export 'package:forms360_uikit/src/widgets/inputs/otp_input.dart';

//items
export 'package:forms360_uikit/src/widgets/items/tag_item.dart';

//phone_form_field
export 'package:phone_form_field/phone_form_field.dart';

//model
export 'package:forms360_uikit/src/model/generated_form_model.dart';
export 'package:forms360_uikit/src/model/library_template_enum.dart';
export 'package:forms360_uikit/src/model/child_form_generated_extension.dart';

//abstract class
class FormsKit {
  static Theme theme = Theme();
  static UiWidget widget = UiWidget();
}
