import 'package:flutter/cupertino.dart';
import 'package:forms360_uikit/src/widgets/pop_up/delete_custom_pop_up.dart';

class WidgetIndexPopUp {
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
