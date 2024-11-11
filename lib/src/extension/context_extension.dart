import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/widgets/pop_up/pop_up_index.dart';

extension ContextExtension on BuildContext {
  Future<void> openPopUp(Widget child) => PopUpIndex().general(
        this,
        child: child,
      );

  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get onPrimaryColor => Theme.of(this).colorScheme.onPrimary;

  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  Color get onSurfaceColor => Theme.of(this).colorScheme.onSurface;
  Color get surfaceContainer => Theme.of(this).colorScheme.surfaceContainer;

  Color get secondaryColor => Theme.of(this).colorScheme.secondary;

  Color get errorColor => Theme.of(this).colorScheme.error;
}