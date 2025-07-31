import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/inputs/custom_input_otp_mobile.dart';

class OtpInputMobile extends StatefulWidget {
  final double? fontSizeWidth;
  final double? fontSizeHeight;
  final Function(String)? onSubmit;
  final PlatformAlertType? platform;
  final List<TextEditingController> controllers;

  const OtpInputMobile({
    super.key,
    this.onSubmit,
    this.platform,
    this.fontSizeWidth,
    this.fontSizeHeight,
    required this.controllers,
  });

  @override
  State<OtpInputMobile> createState() => _OtpInputStateMobile();
}

class _OtpInputStateMobile extends State<OtpInputMobile> {
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    focusNodes = List.generate(
      widget.controllers.length,
      (index) => FocusNode(),
    );
  }

  @override
  void dispose() {
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _handleInput(String value, int index) {
    if (value.isNotEmpty) {
      if (index < widget.controllers.length - 1) {
        focusNodes[index + 1].requestFocus();
      } else {
        bool allFilled = widget.controllers.every(
          (controller) => controller.text.isNotEmpty,
        );
        if (allFilled) {
          for (var node in focusNodes) {
            node.unfocus();
          }
          String fullValue = widget.controllers.map((c) => c.text).join();
          widget.onSubmit?.call(fullValue);
        }
      }
    } else {
      if (index > 0) focusNodes[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.controllers.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: CustomInputOtpMobile(
            platform: widget.platform,
            allFocusNodes: focusNodes,
            focusNode: focusNodes[index],
            allControllers: widget.controllers,
            fontSizeWidth: widget.fontSizeWidth,
            controller: widget.controllers[index],
            fontSizeHeight: widget.fontSizeHeight,
            onSubmit: (value) => _handleInput(value, index),
            nextFocusNode: index < widget.controllers.length - 1
                ? focusNodes[index + 1]
                : null,
          ),
        ),
      ),
    );
  }
}
