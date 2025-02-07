import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:drop_down_search_field/drop_down_search_field.dart';

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
    this.enabled = true,
    this.initialValue,
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
  final bool enabled;
  final String? initialValue;

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
  void initState() {
    if(widget.initialValue != null) {
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
            style: AppearanceKitTextTheme.build().input.copyWith(
                  color: _generateColor(),
                  fontWeight: FontWeight.w400,
                ),
            cursorColor: _generateColor(),
            decoration: InputDecoration(
              hintText: widget.hintText,
              labelText: widget.label,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: _generateColor())),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: _generateColor())),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: _generateColor())),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: _generateColor())),
              hintStyle: AppearanceKitTextTheme.build()
                  .input
                  .copyWith(color: _generateColor()),
              labelStyle: AppearanceKitTextTheme.build()
                  .input
                  .copyWith(color: _generateColor()),
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
              widget.onSuggestionSelected(suggestion);
            } else {
              widget.dropdownSearchFieldController.text = suggestion;
              widget.onSuggestionSelected(suggestion);
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
