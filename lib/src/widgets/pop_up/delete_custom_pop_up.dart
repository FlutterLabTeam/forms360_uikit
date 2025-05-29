import 'package:flutter/cupertino.dart';
import 'package:forms360_uikit/forms360_uikit.dart';

class DeleteCustomPopUp extends StatelessWidget {
  final String title;
  final Function() onTap;
  final String description;

  const DeleteCustomPopUp({
    super.key,
    required this.onTap,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: context.largeText,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Text(
          description,
          style: context.descriptionText,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 40),
        FormsKit.widget.buttons.button(title: "Delete", onPressed: onTap),
      ],
    );
  }
}
