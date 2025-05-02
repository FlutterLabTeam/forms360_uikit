import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';

class TagItem extends StatelessWidget {
  final String name;
  final VoidCallback? onTap;
  final VoidCallback? handledDelete;
  final bool isSelected;

  const TagItem({
    super.key,
    required this.name,
    this.onTap,
    this.handledDelete,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Stack(
        children: [
          FormsKit.widget.buttons.button(
            title: name,
            onPressed: onTap ?? () {},
            buttonType:
                isSelected ? ButtonTypeKit.primary : ButtonTypeKit.fourth,
            style: context.buttonText.copyWith(
              fontWeight: FontWeight.w300,
              color: context.surfaceColor,
            ),
          ),
          Visibility(
            visible: handledDelete != null,
            child: Positioned(
              top: 5,
              right: 5,
              child: InkWell(
                onTap: handledDelete,
                child: Icon(
                  Icons.clear,
                  size: 12,
                  color: context.surfaceColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
