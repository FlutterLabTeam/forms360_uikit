import 'package:flutter/cupertino.dart';
import 'package:forms360_uikit/forms360_uikit.dart';

class MessagePopUp extends StatelessWidget {
  final String title;
  final String description;
  final PlatformAlertType? platformType;

  const MessagePopUp({
    super.key,
    this.platformType,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: platformType == PlatformAlertType.WEB
              ? context.largeText
              : context.mobileTitleText,
        ),
        SizedBox(height: 20),
        Text(
          description,
          style: context.descriptionText,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
