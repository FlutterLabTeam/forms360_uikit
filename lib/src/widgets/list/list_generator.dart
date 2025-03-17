import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';

class ListGenerator<T> extends StatelessWidget {
  final List<T> list;
  final String? label;
  final IconData? icon;
  final Function(T) itemBuilder;

  const ListGenerator({
    super.key,
    this.icon,
    this.label,
    required this.list,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return list.isNotEmpty
        ? ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, int index) => itemBuilder(list[index]),
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
