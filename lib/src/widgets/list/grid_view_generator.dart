import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridViewGenerator<T> extends StatelessWidget {
  final List<T> list;
  final String? label;
  final IconData? icon;
  final int? crossAxisCount;
  final double? mainAxisSpacing;
  final double? crossAxisSpacing;
  final Function(T, int) itemBuilder;

  const GridViewGenerator({
    super.key,
    this.icon,
    this.label,
    required this.list,
    this.crossAxisCount,
    this.mainAxisSpacing,
    this.crossAxisSpacing,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return list.isNotEmpty
        ? MasonryGridView.count(
            itemCount: list.length,
            crossAxisCount: crossAxisCount ?? 3,
            mainAxisSpacing: mainAxisSpacing ?? 16,
            crossAxisSpacing: crossAxisSpacing ?? 30,
            itemBuilder: (_, int index) => itemBuilder(list[index], index),
          )
        : Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon ?? Icons.inbox,
                  size: 60,
                  color: context.primaryColor,
                ),
                SizedBox(height: 10),
                Text(
                  label ?? "No matching records found",
                  style: FormsKit.theme.text.primary.copyWith(
                    color: context.primaryColor,
                  ),
                )
              ],
            ),
          );
  }
}
