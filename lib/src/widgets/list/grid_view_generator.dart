import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridViewGenerator<T> extends StatelessWidget {
  final List<T> list;
  final String? label;
  final IconData? icon;
  final Function(T, int) itemBuilder;

  const GridViewGenerator({
    super.key,
    this.icon,
    this.label,
    required this.list,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 16,
      crossAxisSpacing: 30,
      itemCount: list.length,
      itemBuilder: (_, int index) => itemBuilder(list[index], index),
    );
  }
}
