import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forms360_uikit/forms360_uikit.dart';

class CustomInputOtp extends StatelessWidget {
  final FocusNode? focusNode;
  final double? fontSizeWidth;
  final double? fontSizeHeight;
  final FocusNode? nextFocusNode;
  final PlatformAlertType? platform;
  final Function(String)? onSubmit;
  final List<FocusNode> allFocusNodes;
  final TextEditingController controller;
  final List<TextEditingController> allControllers;

  const CustomInputOtp({
    super.key,
    this.onSubmit,
    this.focusNode,
    this.nextFocusNode,
    this.fontSizeWidth,
    this.fontSizeHeight,
    required this.controller,
    required this.allFocusNodes,
    required this.allControllers,
    this.platform = PlatformAlertType.WEB,
  });

  void _handleInput(String value) {
    if (value.isNotEmpty) {
      bool allFilled =
          allControllers.every((controller) => controller.text.isNotEmpty,);

      if (allFilled) {
        for (var node in allFocusNodes) {
          node.unfocus();
        }
        String fullValue = allControllers.map((c) => c.text).join();
        onSubmit?.call(fullValue);
      } else {
        int currentIndex = allControllers.indexOf(controller);
        for (int i = currentIndex + 1; i < allControllers.length; i++) {
          if (allControllers[i].text.isEmpty) {
            allFocusNodes[i].requestFocus();
            break;
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fontSizeWidth ?? 80,
      height: fontSizeHeight ?? 130,
      child: TextField(
        maxLength: 1,
        focusNode: focusNode,
        controller: controller,
        onChanged: _handleInput,
        onTap: () => controller.clear(),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        buildCounter: (
          context, {
          maxLength,
          required isFocused,
          required currentLength,
        }) =>
            null,
        style: context.titleText,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFE8EDF1),
          contentPadding: platform == PlatformAlertType.WEB
              ? const EdgeInsets.symmetric(vertical: 30)
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Color(0xFFE8EDF1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.blue, width: 2),
          ),
        ),
      ),
    );
  }
}
