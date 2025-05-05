import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forms360_uikit/forms360_uikit.dart';

class CustomInputOtp extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final List<TextEditingController> allControllers;
  final List<FocusNode> allFocusNodes;
  final Function(String)? onSubmit;
  const CustomInputOtp({
    super.key, 
    required this.controller,
    this.focusNode,
    this.nextFocusNode,
    required this.allControllers,
    required this.allFocusNodes,
    this.onSubmit,
  });

  void _handleInput(String value) {
    if (value.isNotEmpty) {
      bool allFilled = allControllers.every((controller) => controller.text.isNotEmpty);
      
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
      width: 80,
      height: 130,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        onTap: () {
          controller.clear();
        },
        onChanged: _handleInput,
        maxLength: 1,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
        style: context.titleText,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFE8EDF1),
          contentPadding: const EdgeInsets.symmetric(vertical: 30),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              color: Color(0xFFE8EDF1),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
