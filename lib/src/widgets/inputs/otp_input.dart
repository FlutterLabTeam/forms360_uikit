import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/widgets/inputs/custom_input_otp.dart';

class OtpInput extends StatefulWidget {
  final double? fontSizeWidth;
  final double? fontSizeHeight;
  final Function(String)? onSubmit;
  final List<TextEditingController> controllers;

  const OtpInput({
    super.key, 
    this.onSubmit,
    this.fontSizeHeight,
    this.fontSizeWidth,
    required this.controllers,
  });

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
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
      bool allFilled = widget.controllers.every((controller) => controller.text.isNotEmpty);
      
      if (allFilled) {
        for (var node in focusNodes) {
          node.unfocus();
        }
        String fullValue = widget.controllers.map((c) => c.text).join();
        widget.onSubmit?.call(fullValue);
      } else {
        for (int i = index + 1; i < widget.controllers.length; i++) {
          if (widget.controllers[i].text.isEmpty) {
            focusNodes[i].requestFocus();
            break;
          }
        }
      }
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
          child: CustomInputOtp(
            allFocusNodes: focusNodes,
            focusNode: focusNodes[index],
            allControllers: widget.controllers,
            fontSizeWidth: widget.fontSizeWidth,
            controller: widget.controllers[index],
            fontSizeHeight: widget.fontSizeHeight,
            onSubmit: (value) => _handleInput(value, index),
            nextFocusNode: index < widget.controllers.length - 1 ? focusNodes[index + 1] : null,
          ),
        ),
      ),
    );
  }
}
