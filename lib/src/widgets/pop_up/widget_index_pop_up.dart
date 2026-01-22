import 'package:flutter/cupertino.dart';
import 'package:forms360_uikit/src/model/delete_custom_enum.dart';
import 'package:forms360_uikit/src/widgets/pop_up/delete_custom_pop_up.dart';
import 'package:forms360_uikit/src/widgets/pop_up/message_pop_up%20copy.dart';
import 'package:forms360_uikit/src/widgets/pop_up/question_pop_up.dart';

class WidgetIndexPopUp {
  Widget deletePopUp({
    required String title,
    required Function() onTap,
    required String description,
    PlatformAlertType? platformType,
    String? buttonText,
  }) => DeleteCustomPopUp(
    onTap: onTap,
    title: title,
    description: description,
    platformType: platformType,
    buttonText: buttonText,
  );

  Widget messagePopUp({
    required String title,
    required String description,
    PlatformAlertType? platformType,
  }) => MessagePopUp(
    title: title,
    description: description,
    platformType: platformType,
  );

  Widget questionPopUp({
    required String title,
    required Function() onYesTap,
    required Function() onNoTap,
    required String description,
    required String yesText,
    required String noText,
  }) => QuestionPopUp(
    onYesTap: onYesTap,
    onNoTap: onNoTap,
    title: title,
    description: description,
    yesText: yesText,
    noText: noText,
  );
}
