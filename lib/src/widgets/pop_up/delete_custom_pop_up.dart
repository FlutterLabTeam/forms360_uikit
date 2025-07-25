import 'package:flutter/cupertino.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/model/delete_custom_enum.dart';



class DeleteCustomPopUp extends StatelessWidget {
  final String title;
  final Function() onTap;
  final String description;
  final String? buttonText;
  final PlatformType? platformType;

  const DeleteCustomPopUp({
    super.key,
    this.buttonText,
    this.platformType,
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
          style: platformType == PlatformType.WEB ? context.largeText : context.mobileTitleText,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Text(
          description,
          style: context.descriptionText,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 40),
        FormsKit.widget.buttons.button(title: buttonText ?? "Delete", onPressed: onTap),
      ],
    );
  }
}
