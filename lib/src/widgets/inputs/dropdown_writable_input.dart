import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:drop_down_search_field/drop_down_search_field.dart';

class DropdownWritableInput extends StatefulWidget {
  DropdownWritableInput({
    super.key,
    this.validator,
    this.initialValue,
    this.fontSize = 16,
    required this.items,
    this.enabled = true,
    this.contentPadding,
    required this.label,
    required this.hintText,
    required this.inputColor,
    this.addNewItemTitle = "",
    this.onSelectedValuesChanged,
    this.selectedValues = const [],
    required this.onSuggestionSelected,
    required this.dropdownSearchFieldController,
    this.type = DropdownWritableInputType.SINGLE,
  });

  final String label;
  final bool enabled;
  final String hintText;
  final double? fontSize;
  final List<String> items;
  final String? initialValue;
  final String addNewItemTitle;
  final List<String> selectedValues;
  final DropdownWritableInputType type;
  final PrimaryInputColorKit inputColor;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;
  final void Function(String) onSuggestionSelected;
  final Function(List<String>)? onSelectedValuesChanged;
  final TextEditingController dropdownSearchFieldController;

  @override
  State<DropdownWritableInput> createState() => _DropdownWritableInputState();
}

class _DropdownWritableInputState extends State<DropdownWritableInput> {
  SuggestionsBoxController suggestionBoxController = SuggestionsBoxController();

  List<String> getSuggestions(String query) {
    List<String> matches = <String>[];
    matches.addAll(widget.items);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));

    if (widget.addNewItemTitle.isNotEmpty) {
      matches.add(widget.addNewItemTitle);
    }
    return matches;
  }

  @override
  void initState() {
    if (widget.initialValue != null) {
      widget.dropdownSearchFieldController.text = widget.initialValue!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropDownSearchFormField(

          enabled: widget.enabled,
          textFieldConfiguration: TextFieldConfiguration(
            enabled: widget.enabled,
            style: AppearanceKitTextTheme.build()
                .input
                .copyWith(color: _generateColorInput(), fontSize: 20),
            cursorColor: _generateColor(),

            decoration: InputDecoration(

              labelText: widget.label,
              hintText: widget.hintText,
              contentPadding: widget.contentPadding??EdgeInsets.only(top: 18, bottom: 22, left: 19.21, right: 19.21),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: _generateColor()),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: _generateColor()),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: _generateColor()),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: _generateColor()),
              ),
              labelStyle: AppearanceKitTextTheme.build()
                  .input
                  .copyWith(color: _generateColorInput(), fontSize: 20),
              hintStyle: AppearanceKitTextTheme.build()
                  .input
                  .copyWith(color: _generateColorInput(), fontSize: 20),
            ),
            controller: widget.dropdownSearchFieldController,
          ),
          suggestionsCallback: (pattern) => getSuggestions(pattern),
          itemBuilder: (context, String suggestion) {
            if (widget.addNewItemTitle.isNotEmpty &&
                suggestion == widget.addNewItemTitle) {
              return ListTile(
                title: Text(
                  suggestion,
                  textAlign: TextAlign.center,
                ),
                titleAlignment: ListTileTitleAlignment.center,
              );
            }

            return ListTile(title: Text(suggestion));
          },
          itemSeparatorBuilder: (context, index) => Divider(),
          transitionBuilder: (context, suggestionsBox, controller) {
            return suggestionsBox;
          },
          onSuggestionSelected: (String suggestion) {
            if (widget.type == DropdownWritableInputType.MULTI) {
              if (widget.selectedValues.contains(suggestion)) {
                widget.selectedValues.remove(suggestion);
              } else {
                widget.selectedValues.add(suggestion);
              }

              setState(() {});
              if (widget.onSelectedValuesChanged != null) {
                widget.onSelectedValuesChanged!(widget.selectedValues);
              }
              widget.onSuggestionSelected(suggestion);
            } else {
              if (widget.addNewItemTitle != suggestion) {
                widget.dropdownSearchFieldController.text = suggestion;
                widget.onSuggestionSelected(suggestion);
              } else {
                widget.dropdownSearchFieldController.text = "";
                widget.onSuggestionSelected(suggestion);
              }
            }
          },
          suggestionsBoxController: suggestionBoxController,
          validator: widget.validator ??
              (value) {
                if (value!.isEmpty &&
                    widget.type == DropdownWritableInputType.SINGLE) {
                  return 'Please select a value';
                } else {
                  return null;
                }
              },
          onSaved: (value) => widget.selectedValues.add(value!),
          displayAllSuggestionWhenTap: widget.enabled,
        ),
        if (widget.selectedValues.isNotEmpty)
          Wrap(
            spacing: 5.0,
            children: List<Widget>.generate(
              widget.selectedValues.length,
              (int index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Chip(
                    label: Text(
                      widget.selectedValues[index],
                      style: TextStyle(fontSize: widget.fontSize),
                    ),
                    onDeleted: () {
                      widget.selectedValues.remove(
                        widget.selectedValues[index],
                      );
                      setState(() {});
                      if (widget.onSelectedValuesChanged != null) {
                        widget.onSelectedValuesChanged!(widget.selectedValues);
                      }
                    },
                  ),
                );
              },
            ).toList(),
          ),
      ],
    );
  }


  Color _generateColorInput() {
    if (widget.inputColor == PrimaryInputColorKit.BLACK) return Colors.black;
    return Theme.of(context).colorScheme.primary;
  }

  Color _generateColor() {
    if (widget.inputColor == PrimaryInputColorKit.BLACK) return Colors.black;
    return Theme.of(context).colorScheme.primary;
  }
}
