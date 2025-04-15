import 'package:flutter/cupertino.dart';
import 'package:forms360_uikit/forms360_uikit.dart';

class QuestionPopUp extends StatelessWidget {
  final String title;
  final Function() onYesTap;
  final Function() onNoTap;
  final String description;
  final String yesText;
  final String noText;

  const QuestionPopUp({
    super.key,
    required this.onYesTap,
    required this.onNoTap,
    required this.title,
    required this.description,
    required this.yesText,
    required this.noText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: context.largeText),
        SizedBox(height: 20),
        Text(
          description,
          style: context.descriptionText,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 40),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 150,
              child: FormsKit.widget.buttons.button(
                  buttonType: ButtonTypeKit.secondary,
                  sizeButton: SizeButtonKit.big,
                  title: noText,
                  onPressed: onNoTap),
            ),
            Container(
              width: 150,
              child: FormsKit.widget.buttons.button(
                  sizeButton: SizeButtonKit.big,
                  title: yesText,
                  onPressed: onYesTap),
            ),
          ],
        ),
      ],
    );
  }
}
