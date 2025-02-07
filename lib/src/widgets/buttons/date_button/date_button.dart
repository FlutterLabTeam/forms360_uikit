import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';

class DateButton extends StatefulWidget {
  DateButton({
    super.key,
    this.width = 200,
    required this.onTap,
    required this.dateController,
    required this.label,
    this.selectedDate,
  });
  final double width;
  final Function(DateTime?) onTap;
  final TextEditingController dateController;
  final DateTime? selectedDate;
  final String label;
  @override
  State<DateButton> createState() => _DateButtonState();
}

class _DateButtonState extends State<DateButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: widget.width,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Color(0xFFF5F7FA),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: const Color(0xFFF5F7FA),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: () => _selectDate(context),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.date_range,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8.0),
                widget.dateController.text.isNotEmpty
                    ? FittedBox(
                        child: Text(
                          widget.dateController.text.isNotEmpty
                              ? widget.dateController.text
                              : widget.label,
                          style: widget.dateController.text.isNotEmpty
                              ? context.primaryText.copyWith(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).colorScheme.primary,
                                )
                              : context.primaryText.copyWith(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFFC0CDE1),
                                ),
                        ),
                      )
                    : Container(),
                if (widget.dateController.text.isNotEmpty)
                  IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () {
                      widget.dateController.clear();
                      setState(() {});
                    },
                  ),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            top: widget.dateController.text.isNotEmpty ? -12 : 20,
            left: widget.dateController.text.isNotEmpty ? 12 : 30,
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                fontSize: widget.dateController.text.isNotEmpty ? 12 : 16,
                color: widget.dateController.text.isNotEmpty
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
              ),
              child: Text(widget.label),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        lastDate: DateTime(2101),
        firstDate: DateTime(2000),
        initialDate: widget.selectedDate ?? DateTime.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: context.onSurfaceColor,
                onPrimary: context.primaryColor,
                onSurface: context.primaryColor,
              ),
              textButtonTheme: TextButtonThemeData(
                style:
                    TextButton.styleFrom(foregroundColor: context.primaryColor),
              ),
            ),
            child: child!,
          );
        });
    if (picked != null) {
      setState(() => widget.onTap(picked));
    }
  }
}
