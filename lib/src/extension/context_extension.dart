import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/pop_up/pop_up_index.dart';

extension ContextExtension on BuildContext {
  Future<void> openPopUp(
    Widget child, {
    PopUpSize popUpSize = PopUpSize.LONG,
    bool barrierDismissible = true,
  }) =>
      PopUpIndex().general(
        this,
        child: child,
        popUpSize: popUpSize,
        barrierDismissible: barrierDismissible,
      );

  Future<void> openTabbedPopUp({
    required PageController pageController,
    required List<Widget> children,
    required List<Widget> footers,
    PopUpSize popUpSize = PopUpSize.LONG,
    double? height,
    bool barrierDismissible = true,
  }) =>
      PopUpIndex().tabbed(
        this,
        pageController: pageController,
        children: children,
        popUpSize: popUpSize,
        footers: footers,
        height: height,
        barrierDismissible: barrierDismissible,
      );

  Future<void> openSuccessPopUp({
    required String message,
    required String okText,
    bool barrierDismissible = true,
  }) =>
      PopUpIndex().successPopUp(
        this,
        message: message,
        okText: okText,
        barrierDismissible: barrierDismissible,
      );

  Future<void> openErrorPopUp({
    required String message,
    required String okText,
    bool barrierDismissible = true,
  }) =>
      PopUpIndex().errorPopUp(
        this,
        message: message,
        okText: okText,
        barrierDismissible: barrierDismissible,
      );

  //colors them access by context
  Color get grey1 => AppearanceKitColors.light().grey1;
  Color get grey2 => AppearanceKitColors.light().grey2;
  Color get grey3 => AppearanceKitColors.light().grey3;
  Color get greyBlue => AppearanceKitColors.light().greyBlue;

  Color get errorColor => Theme.of(this).colorScheme.error; //red
  Color get primaryColor => Theme.of(this).colorScheme.primary; //blue
  Color get surfaceColor => Theme.of(this).colorScheme.surface; //white
  Color get secondaryColor => Theme.of(this).colorScheme.secondary; // green
  Color get onPrimaryColor => Theme.of(this).colorScheme.onPrimary;

  ///dark blue
  Color get onSurfaceColor => Theme.of(this).colorScheme.onSurface; //blue sea water
  Color get primaryLightColor => Theme.of(this).colorScheme.primaryContainer; //light blue
  Color get surfaceContainerColor => Theme.of(this).colorScheme.surfaceContainer; //light blue

  //text styles access by context
  TextStyle get titleText => FormsKit.theme.text.title;
  TextStyle get buttonText => FormsKit.theme.text.button;
  TextStyle get inputText => FormsKit.theme.text.input;
  TextStyle get primaryText => FormsKit.theme.text.primary;
  TextStyle get mobileTitleText => FormsKit.theme.text.mobileTitleText;
  TextStyle get mobileDescriptionText => FormsKit.theme.text.mobileDescriptionText;
  TextStyle get descriptionText => FormsKit.theme.text.description;
  TextStyle get secondaryText => FormsKit.theme.text.secondary;
  TextStyle get smallDescriptionText => FormsKit.theme.text.smallDescription;
  TextStyle get linkText => FormsKit.theme.text.link;
  TextStyle get largeText => FormsKit.theme.text.large;
  TextStyle get extraLargeText => FormsKit.theme.text.extraLarge;

  //implementing size
  double sizeWidth([double? size]) => size != null
      ? MediaQuery.of(this).size.width * size
      : MediaQuery.of(this).size.width;
  double sizeHeight([double? size]) => size != null
      ? MediaQuery.of(this).size.height * size
      : MediaQuery.of(this).size.height;
}
