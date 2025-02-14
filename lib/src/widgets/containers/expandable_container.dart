import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forms360_uikit/forms360_uikit.dart';

class ExpandableContainer extends StatefulWidget {
  final Widget child;
  ExpandableContainer({super.key,required this.child});

  @override
  createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer> {
  final horizontalMargin = const EdgeInsets.symmetric(
    horizontal: 20,
  );
  bool isExpanded = false;

  _getSelectedBackgroundColor() {
    return isExpanded ? context.onPrimaryColor : context.surfaceContainerColor;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: isExpanded ? 400 : 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _getSelectedBackgroundColor(),
        ),
        curve: Curves.easeIn,
        child: Container(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: widget.child,
          ),
        ));
  }

}
