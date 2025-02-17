import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/buttons/custom_button/widget/custom_border.dart';

class DottedButton extends StatefulWidget {
  final String label;
  final double? width;
  final double? height;
  final VoidCallback onTap;
  final double? labelSize;
  final Color? backgroundColor;
  final Color? labelColor;
  final EdgeInsetsGeometry? padding;
  final IconData? icon;

  const DottedButton({
    super.key,
    required this.label,
    this.width,
    this.height,
    required this.onTap,
    this.labelSize = 13,
    this.backgroundColor,
    this.labelColor,
    this.icon = Icons.add,
    this.padding,
  });

  @override
  State<DottedButton> createState() => _DottedButtonState();
}

class _DottedButtonState extends State<DottedButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: CustomPaint(
        painter: CustomBorder(widget.labelColor!, BorderType.DOTTED),
        child: Container(
          padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.center,
          width: widget.width ?? MediaQuery.of(context).size.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                color: widget.labelColor,
                size: 18.0,
              ),
              const SizedBox(width: 8.0),
              Text(
                widget.label,
                style: context.primaryText.copyWith(
                  color: widget.labelColor,
                  fontSize: widget.labelSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}