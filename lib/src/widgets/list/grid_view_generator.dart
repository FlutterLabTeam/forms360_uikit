import 'package:flutter/cupertino.dart';
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
    return MasonryGridView.count(
      itemCount: list.length,
      crossAxisCount: crossAxisCount ?? 3,
      mainAxisSpacing: mainAxisSpacing ?? 16,
      crossAxisSpacing: crossAxisSpacing ?? 30,
      itemBuilder: (_, int index) => itemBuilder(list[index], index),
    );
  }
}
