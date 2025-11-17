import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forms360_uikit/forms360_uikit.dart';

class CustomInputOtp extends StatefulWidget {
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

  @override
  State<CustomInputOtp> createState() => _CustomInputOtpState();
}

class _CustomInputOtpState extends State<CustomInputOtp> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    // Inicializar con "*" si está vacío
    if (widget.controller.text.isEmpty) {
      widget.controller.text = "*";
      widget.controller.selection = TextSelection.collapsed(offset: 1);
    }

    // Escuchar cambios en el controlador
    widget.controller.addListener(_onControllerChanged);

    // Escuchar cuando se obtiene el foco
    widget.focusNode?.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerChanged);
    widget.focusNode?.removeListener(_onFocusChanged);
    super.dispose();
  }

  void _onFocusChanged() {
    if (widget.focusNode?.hasFocus == true) {
      // Posicionar cursor al final del texto cuando se obtiene el foco
      widget.controller.selection = TextSelection.collapsed(
        offset: widget.controller.text.length,
      );
      setState(() {}); // Actualizar UI
    }
  }

  void _onControllerChanged() {
    // Si el texto está vacío después de ser inicializado, volver a poner "*"
    if (widget.controller.text.isEmpty && _isInitialized) {
      widget.controller.text = "*";
      widget.controller.selection = TextSelection.collapsed(offset: 1);

      // Navegar al input anterior
      int currentIndex = widget.allControllers.indexOf(widget.controller);
      if (currentIndex > 0) {
        widget.allFocusNodes[currentIndex - 1].requestFocus();
      }

      setState(() {}); // Actualizar UI
    } else {
      // Actualizar UI para cualquier cambio en el controlador
      setState(() {});
    }
  }

  void _handleInput(String value) {
    int currentIndex = widget.allControllers.indexOf(widget.controller);

    // Marcar como inicializado después del primer input
    if (!_isInitialized) {
      _isInitialized = true;
    }

    if (value.isNotEmpty && value != "*") {
      // Si se ingresó un número válido
      if (currentIndex < widget.allControllers.length - 1) {
        widget.allFocusNodes[currentIndex + 1].requestFocus();
      } else {
        bool allFilled = widget.allControllers.every(
          (controller) => controller.text.isNotEmpty && controller.text != "*",
        );
        if (allFilled) {
          for (var node in widget.allFocusNodes) {
            node.unfocus();
          }
          String fullValue = widget.allControllers
              .map((c) => c.text == "*" ? "" : c.text)
              .join();
          widget.onSubmit?.call(fullValue);
        }
      }
    } else if (value.isEmpty || value == "*") {
      // Si se eliminó el texto o quedó solo "*"
      if (currentIndex > 0) {
        widget.allFocusNodes[currentIndex - 1].requestFocus();
      }
    }

    // Actualizar UI después de cualquier cambio
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.fontSizeWidth ?? 70,
      height: widget.fontSizeHeight ?? 130,
      child: TextField(
        maxLength: 1,
        focusNode: widget.focusNode,
        controller: widget.controller,
        onChanged: _handleInput,
        onTap: () {
          widget.controller.selection = TextSelection.collapsed(
            offset: widget.controller.text.length,
          );
          setState(() {});
        },
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        cursorColor: Colors.transparent,
        buildCounter:
            (
              context, {
              maxLength,
              required isFocused,
              required currentLength,
            }) => null,
        style: widget.controller.text == "*"
            ? context.mobileTitleText.copyWith(
                color: Colors.transparent,
                fontSize: 32, // Tamaño de fuente reducido
              )
            : context.mobileTitleText.copyWith(
                fontSize: 32, // Tamaño de fuente reducido
              ),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFE8EDF1),
          contentPadding: widget.platform == PlatformAlertType.WEB
              ? const EdgeInsets.symmetric(vertical: 50)
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
