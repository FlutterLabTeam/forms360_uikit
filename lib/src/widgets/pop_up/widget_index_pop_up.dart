import 'package:flutter/cupertino.dart';
import 'package:forms360_uikit/src/model/delete_custom_enum.dart';
import 'package:forms360_uikit/src/widgets/pop_up/delete_custom_pop_up.dart';
import 'package:forms360_uikit/src/widgets/pop_up/question_pop_up.dart';

class WidgetIndexPopUp {
  Widget deletePopUp({
    required String title,
    required Future<void> Function() onTap,
    required String description,
    PlatformAlertType? platformType,
    String? buttonText,
  }) =>
      DeleteCustomPopUp(
        onTap: onTap,
        title: title,
        description: description,
        platformType: platformType,
        buttonText: buttonText,
      );

  Widget questionPopUp({
    required String title,
    required Function() onYesTap,
    required Function() onNoTap,
    required String description,
    required String yesText,
    required String noText,
  }) =>
      QuestionPopUp(
        onYesTap: onYesTap,
        onNoTap: onNoTap,
        title: title,
        description: description,
        yesText: yesText,
        noText: noText,
      );
}
