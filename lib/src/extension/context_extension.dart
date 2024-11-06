import 'package:flutter/cupertino.dart';
import 'package:forms360_uikit/src/widgets/pop_up/pop_up_index.dart';

extension ContextExtension on BuildContext {
  Future<void> openPopUp(Widget child) => PopUpIndex().general(
        this,
        child: child,
      );
}
