import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';

class WrapGenerator<T> extends StatelessWidget {
  final List<T> list;
  final String? label;
  final IconData? icon;
  final double? spacing;
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
    this.crossAxisCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return list.isNotEmpty
        ? ScrollbarTheme(
            data: ScrollbarThemeData(
              thumbColor: MaterialStateProperty.all(
                context.primaryColor.withOpacity(0.5),
              ),
            ),
            child: Scrollbar(
                thickness: 6.0,
                interactive: true,
                thumbVisibility: true,
                trackVisibility: true,
                radius: Radius.circular(10),
                scrollbarOrientation: ScrollbarOrientation.right,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: spacing ?? 10,
                  runSpacing: runSpacing ?? 10,
                  children: List.generate(
                    list.length,
                    (index) => itemBuilder(list[index], index),
                  ),
                )),
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
