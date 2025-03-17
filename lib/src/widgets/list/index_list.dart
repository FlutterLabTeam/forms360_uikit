import 'package:flutter/cupertino.dart';
import 'package:forms360_uikit/src/widgets/list/list_generator.dart';

class UiList {
  ListGenerator listGenerator<T>({
    String? label,
    IconData? icon,
    required List<T> list,
    required Function(T) itemBuilder,
  }) =>
      ListGenerator<T>(
        list: list,
        icon: icon,
        label: label,
        itemBuilder: itemBuilder,
      );
}
