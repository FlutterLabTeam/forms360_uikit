import 'package:flutter/cupertino.dart';
import 'package:forms360_uikit/src/model/pop_up_model.dart';
import 'package:forms360_uikit/src/widgets/pop_up/error_pop_up.dart';
import 'package:forms360_uikit/src/widgets/pop_up/tabbed_pop_up.dart';
import 'package:forms360_uikit/src/widgets/pop_up/success_pop_up.dart';
import 'package:forms360_uikit/src/widgets/pop_up/general_pop_up.dart';

class PopUpIndex {
  Future<void> general(
    BuildContext context, {
    required Widget child,
    required PopUpSize popUpSize,
    bool barrierDismissible = true,
  }) =>
      generalPopUp(
        context,
        child: child,
        popUpSize: popUpSize,
        barrierDismissible: barrierDismissible,
      );

  Future<void> tabbed(
    BuildContext context, {
    double? height,
    required PopUpSize popUpSize,
    required List<Widget> footers,
    required List<Widget> children,
    required final PageController pageController,
    bool barrierDismissible = true,
  }) =>
      tabbedPopUp(
        context,
        height: height,
        footers: footers,
        children: children,
        popUpSize: popUpSize,
        pageController: pageController,
        barrierDismissible: barrierDismissible,
      );

  Future<void> successPopUp(
    BuildContext context, {
    required String okText,
    required String message,
    bool barrierDismissible = true,
  }) =>
      successPopup(context,
          okText: okText,
          message: message,
          barrierDismissible: barrierDismissible);

  Future<void> errorPopUp(
    BuildContext context, {
    required String okText,
    required String message,
    bool barrierDismissible = true,
  }) =>
      showErrorPopUp(context,
          okText: okText,
          message: message,
          barrierDismissible: barrierDismissible);
}
