import 'package:flutter/cupertino.dart';

extension WidgetExtension on Widget {
  Widget get cursorGesture => MouseRegion(
        child: this,
        cursor: SystemMouseCursors.click,
      );
}
