import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/widgets/pop_up/pop_up_index.dart';

extension ContextExtension on BuildContext {
  Future<void> openPopUp(Widget child) => PopUpIndex().general(
        this,
        child: child,
      );

  Color get errorColor => Theme.of(this).colorScheme.error; //red
  Color get primaryColor => Theme.of(this).colorScheme.primary;//blue
  Color get surfaceColor => Theme.of(this).colorScheme.surface;//white
  Color get secondaryColor => Theme.of(this).colorScheme.secondary; // green
  Color get onPrimaryColor => Theme.of(this).colorScheme.onPrimary; ///dark blue
  Color get onSurfaceColor => Theme.of(this).colorScheme.onSurface;//blue sea water
  Color get surfaceContainer => Theme.of(this).colorScheme.surfaceContainer;//light blue
}