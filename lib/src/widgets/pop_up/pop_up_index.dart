import 'package:flutter/cupertino.dart';
import 'package:forms360_uikit/src/model/pop_up_model.dart';
import 'package:forms360_uikit/src/widgets/pop_up/general_pop_up.dart';
import 'package:forms360_uikit/src/widgets/pop_up/tabbed_pop_up.dart';

class PopUpIndex {
  Future<void> general(
    BuildContext context, {
    required Widget child,
    required PopUpSize popUpSize,
  }) =>
      generalPopUp(context, child: child, popUpSize: popUpSize);

  Future<void> tabbed(
    BuildContext context, {
    required final PageController pageController,
    required List<Widget> children,
    required PopUpSize popUpSize,
    required List<Widget> footers,
  }) =>
      tabbedPopUp(context,
          pageController: pageController,
          children: children,
          footers: footers,
          popUpSize: popUpSize);
}
