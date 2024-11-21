import 'package:flutter/cupertino.dart';
import 'package:forms360_uikit/src/extension/context_extension.dart';

class TextButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final TextStyle? style;

  const TextButton({
    super.key,
    this.style,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final currentStyle = style ?? context.secondaryText.copyWith(fontSize: 14);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Text(text, style: currentStyle),
      ),
    );
  }
}
