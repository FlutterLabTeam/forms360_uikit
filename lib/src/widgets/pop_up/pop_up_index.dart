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

  Future<void> custom(
    BuildContext context, {
    required Widget header,
    required Widget body,
    required Widget footer,
    required PopUpSize popUpSize,
  }) =>
      customPopUp(context,
          header: header, body: header, footer: footer, popUpSize: popUpSize);
}
