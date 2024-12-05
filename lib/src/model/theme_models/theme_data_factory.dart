import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/theme/text/texts.dart';
import 'package:forms360_uikit/src/model/theme_models/theme_data.dart';

/// This is the factory used to create the theme from the colors and textTheme
/// You can create your own factory to create your own theme
/// see universal_theme.dart for an example
abstract class AppearanceKitThemeDataFactory {
  const AppearanceKitThemeDataFactory();

  AppearanceKitThemeData build({
    required AppearanceKitColors colors,
    required AppearanceKitTextTheme defaultTextStyle,
  });
}
