import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/extension/context_extension.dart';

class DateInput extends StatelessWidget {
  const DateInput({
    super.key,
    this.fontSize,
    required this.onTap,
    required this.width,
    required this.label,
    required this.hintText,
    required this.validator,
    required this.maxLength,
    required this.controller,
    required this.onTapOutside,
    required this.isClearButtonVisible,
  });

  final String label;
  final double width;
  final int? maxLength;
  final String hintText;
  final double? fontSize;
  final GestureTapCallback? onTap;
  final bool isClearButtonVisible;
  final void Function()? onTapOutside;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 4),
      color: Color(0xFFF5F7FA),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: AbsorbPointer(
                child: Center(
                  child: TextFormField(
                    validator: validator,
                    autofocus: false,
                    maxLength: maxLength,
                    controller: controller,
                    decoration: InputDecoration(
                      hoverColor: Color(0xFFF5F7FA),
                      focusColor: Color(0xFFF5F7FA),
                      counterText: "",
                      filled: true,
                      fillColor: Color(0xFFF5F7FA),
                      prefixIcon: Icon(
                        Icons.date_range,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      labelText: label,
                      hintText: hintText,
                      labelStyle: context.primaryText.copyWith(
                        fontSize: fontSize ?? 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFC0CDE1),
                      ),
                      hintStyle: context.primaryText.copyWith(
                        fontSize: fontSize ?? 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFC0CDE1),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color(0xFFF5F7FA),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color(0xFFF5F7FA),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color(0xFFF5F7FA),
                        ),
                      ),
                    ),
                    cursorHeight: 16,
                    style: context.primaryText.copyWith(
                      fontSize: fontSize ?? 20,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    cursorColor: Theme.of(context).colorScheme.primary,
                    textInputAction: TextInputAction.done,
                  ),
                ),
              ),
            ),
          ),
          if (isClearButtonVisible && controller.text.isNotEmpty)
            Center(
              child: IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  controller.clear();
                  onTapOutside?.call();
                },
              ),
            ),
        ],
      ),
    );
  }
}
