import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/util/texts.dart';
import 'package:drop_down_search_field/drop_down_search_field.dart';

enum DropdownWritableInputType {
  MULTI,
  SINGLE,
}

class DropdownWritableInput extends StatefulWidget {
  DropdownWritableInput({
    super.key,
    required this.items,
    required this.label,
    required this.hintText,
    required this.inputColor,
    this.onSelectedValuesChanged,
    this.selectedValues = const [],
    required this.onSuggestionSelected,
    required this.dropdownSearchFieldController,
    this.type = DropdownWritableInputType.SINGLE,
  });

  final String label;
  final String hintText;
  final List<String> items;
  final List<String> selectedValues;
  final DropdownWritableInputType type;
  final PrimaryInputColorKit inputColor;
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
    return matches;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropDownSearchFormField(
          textFieldConfiguration: TextFieldConfiguration(
            style: FormsTextStyle().input.copyWith(
                  color: _generateColor(),
                  fontWeight: FontWeight.w400,
                ),
            cursorColor: _generateColor(),
            decoration: InputDecoration(
              hintText: widget.hintText,
              labelText: widget.label,
              border: OutlineInputBorder(borderSide: BorderSide(color: _generateColor())),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: _generateColor())),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: _generateColor())),
              disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: _generateColor())),
              hintStyle: FormsTextStyle().input.copyWith(color: _generateColor()),
              labelStyle: FormsTextStyle().input.copyWith(color: _generateColor()),
            ),
            controller: widget.dropdownSearchFieldController,
          ),
          suggestionsCallback: (pattern) => getSuggestions(pattern),
          itemBuilder: (context, String suggestion) {
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
            } else {
              widget.dropdownSearchFieldController.text = suggestion;
            }
          },
          suggestionsBoxController: suggestionBoxController,
          validator: (value) {
            if (value!.isEmpty &&
                widget.type == DropdownWritableInputType.SINGLE) {
              return 'Please select a value';
            } else {
              return null;
            }
          },
          onSaved: (value) => widget.selectedValues.add(value!),
          displayAllSuggestionWhenTap: true,
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
                    label: Text(widget.selectedValues[index]),
                    onDeleted: () {
                      widget.selectedValues
                          .remove(widget.selectedValues[index]);
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

  Color _generateColor() {
    if (widget.inputColor == PrimaryInputColorKit.BLACK) return Colors.black;
    return Theme.of(context).colorScheme.primary;
  }
}
