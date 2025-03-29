import 'package:flutter/cupertino.dart';
import 'package:forms360_uikit/src/widgets/list/grid_view_generator.dart';
import 'package:forms360_uikit/src/widgets/list/list_generator.dart';
import 'package:forms360_uikit/src/widgets/list/wrap_generate.dart';

class UiList {
  ListGenerator listGenerator<T>({
    String? label,
    IconData? icon,
    required List<T> list,
    required Function(T, int) itemBuilder,
  }) =>
      ListGenerator<T>(
        list: list,
        icon: icon,
        label: label,
        itemBuilder: itemBuilder,
      );

  GridViewGenerator gridViewGenerator<T>({
    String? label,
    IconData? icon,
    int? crossAxisCount,
    required List<T> list,
    double? mainAxisSpacing,
    double? crossAxisSpacing,
    required Function(T, int) itemBuilder,
  }) =>
      GridViewGenerator<T>(
        list: list,
        icon: icon,
        label: label,
        itemBuilder: itemBuilder,
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
      );

  WrapGenerator wrapGenerator<T>({
    String? label,
    IconData? icon,
    double? spacing,
    double? runSpacing,
    double? topMargin,
    int? crossAxisCount,
    required List<T> list,
    required Function(T, int) itemBuilder,
  }) =>
      WrapGenerator<T>(
        list: list,
        icon: icon,
        label: label,
        spacing: spacing,
        topMargin: topMargin,
        runSpacing: runSpacing,
        itemBuilder: itemBuilder,
        crossAxisCount: crossAxisCount,
      );
}


