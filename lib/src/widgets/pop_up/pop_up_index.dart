import 'package:flutter/cupertino.dart';
import 'package:forms360_uikit/src/model/pop_up_model.dart';
import 'package:forms360_uikit/src/widgets/pop_up/delete_custom_pop_up.dart';
import 'package:forms360_uikit/src/widgets/pop_up/general_pop_up.dart';
import 'package:forms360_uikit/src/widgets/pop_up/success_pop_up.dart';
import 'package:forms360_uikit/src/widgets/pop_up/tabbed_pop_up.dart';

class PopUpIndex {
  Future<void> general(
    BuildContext context, {
    required Widget child,
    required PopUpSize popUpSize,
  }) =>
      generalPopUp(
        context,
        child: child,
        popUpSize: popUpSize,
      );

  Future<void> tabbed(
    BuildContext context, {
    double? height,
    required PopUpSize popUpSize,
    required List<Widget> footers,
    required List<Widget> children,
    required final PageController pageController,
  }) =>
      tabbedPopUp(
        context,
        height: height,
        footers: footers,
        children: children,
        popUpSize: popUpSize,
        pageController: pageController,
      );

  Future<void> successPopUp(
    BuildContext context, {
    required String okText,
    required String message,
  }) =>
      successPopup(
        context,
        okText: okText,
        message: message,
      );

  Widget deletePopUp({
    required String title,
    required Function() onTap,
    required String description,
  }) =>
      DeleteCustomPopUp(
        onTap: onTap,
        title: title,
        description: description,
      );
}
