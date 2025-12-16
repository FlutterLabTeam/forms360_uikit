import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class _WebScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

class GridViewGenerator<T> extends StatefulWidget {
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
  State<GridViewGenerator<T>> createState() => _GridViewGeneratorState<T>();
}

class _GridViewGeneratorState<T> extends State<GridViewGenerator<T>> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.list.isNotEmpty
        ? ScrollConfiguration(
            behavior: _WebScrollBehavior(),
            child: ScrollbarTheme(
              data: ScrollbarThemeData(
                thumbColor: MaterialStateProperty.all(
                  context.primaryColor.withOpacity(0.5),
                ),
              ),
              child: Scrollbar(
                controller: _scrollController,
                thickness: 6.0,
                interactive: true,
                thumbVisibility: true,
                trackVisibility: true,
                radius: Radius.circular(10),
                scrollbarOrientation: ScrollbarOrientation.right,
                child: MasonryGridView.count(
                  controller: _scrollController,
                  itemCount: widget.list.length,
                  crossAxisCount: widget.crossAxisCount ?? 3,
                  mainAxisSpacing: widget.mainAxisSpacing ?? 16,
                  crossAxisSpacing: widget.crossAxisSpacing ?? 30,
                  itemBuilder: (_, int index) =>
                      widget.itemBuilder(widget.list[index], index),
                ),
              ),
            ),
          )
        : Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.icon ?? Icons.inbox,
                  size: 60,
                  color: context.primaryColor,
                ),
                SizedBox(height: 10),
                Text(
                  widget.label ?? "No matching records found",
                  style: FormsKit.theme.text.primary.copyWith(
                    color: context.primaryColor,
                  ),
                ),
              ],
            ),
          );
  }
}
