import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';

class _WebScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class WrapGenerator<T> extends StatefulWidget {
  final List<T> list;
  final String? label;
  final IconData? icon;
  final double? spacing;
  final double? topMargin;
  final double? runSpacing;
  final int? crossAxisCount;
  final Function(T, int) itemBuilder;

  const WrapGenerator({
    super.key,
    this.icon,
    this.label,
    this.spacing,
    this.runSpacing,
    required this.list,
    this.topMargin = 10,
    this.crossAxisCount,
    required this.itemBuilder,
  });

  @override
  State<WrapGenerator<T>> createState() => _WrapGeneratorState<T>();
}

class _WrapGeneratorState<T> extends State<WrapGenerator<T>> {
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
                thumbColor: WidgetStateProperty.all(
                  context.primaryColor.withValues(alpha: 128),
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
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: widget.spacing ?? 10,
                    runSpacing: widget.runSpacing ?? 10,
                    children: List.generate(
                      widget.list.length,
                      (index) => widget.itemBuilder(widget.list[index], index),
                    ),
                  ),
                ),
              ),
            ),
          )
        : Container(
            margin: EdgeInsets.only(top: widget.topMargin!),
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
                )
              ],
            ),
          );
  }
}
