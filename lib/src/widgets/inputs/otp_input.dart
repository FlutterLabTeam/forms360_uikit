import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/inputs/custom_input_otp.dart';

class OtpInput extends StatefulWidget {
  final double? fontSizeWidth;
  final double? fontSizeHeight;
  final Function(String)? onSubmit;
  final PlatformAlertType? platform;
  final List<TextEditingController> controllers;

  const OtpInput({
    super.key,
    this.onSubmit,
    this.platform,
    this.fontSizeWidth,
    this.fontSizeHeight,
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
    
    // Inicializar todos los controladores con "*" si están vacíos
    for (var controller in widget.controllers) {
      if (controller.text.isEmpty) {
        controller.text = "*";
        controller.selection = TextSelection.collapsed(offset: 1);
      }
    }
    
    // Agregar listeners a todos los controladores para actualizar UI
    for (var controller in widget.controllers) {
      controller.addListener(() {
        setState(() {}); // Actualizar UI cuando cambie cualquier controlador
      });
    }
  }

  @override
  void dispose() {
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _handleInput(String value, int index) {
    if (value.isNotEmpty && value != "*") {
      // Si se ingresó un número válido
      if (index < widget.controllers.length - 1) {
        focusNodes[index + 1].requestFocus();
      } else {
        bool allFilled = widget.controllers.every(
          (controller) => controller.text.isNotEmpty && controller.text != "*",
        );
        if (allFilled) {
          for (var node in focusNodes) {
            node.unfocus();
          }
          String fullValue = widget.controllers
              .map((c) => c.text == "*" ? "" : c.text)
              .join();
          widget.onSubmit?.call(fullValue);
        }
      }
    } else if (value.isEmpty || value == "*") {
      // Si se eliminó el texto o quedó solo "*", navegar al anterior
      if (index > 0) {
        // Asegurar que el input anterior tenga "*" si está vacío
        if (widget.controllers[index - 1].text.isEmpty) {
          widget.controllers[index - 1].text = "*";
          widget.controllers[index - 1].selection = TextSelection.collapsed(offset: 1);
        }
        focusNodes[index - 1].requestFocus();
      }
    }
    
    // Actualizar UI después de cualquier cambio
    setState(() {});
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
