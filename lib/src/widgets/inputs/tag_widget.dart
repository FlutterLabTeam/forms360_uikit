import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';

class TagWidget<T> extends StatelessWidget {
  final List<TagModel<T>> tagList;
  final Function(TagModel<T>) onTap;
  final Function(BuildContext) onTapAdd;
  final String addText;
  final double? itemHeight;
  final double? itemWidth;
  final String? selectedTag;
  final bool showAddButton;

  const TagWidget({
    super.key,
    required this.onTap,
    required this.tagList,
    required this.onTapAdd,
    required this.addText,
    this.itemHeight = 50,
    this.itemWidth,
    this.selectedTag,
    this.showAddButton = true,
  });
  @override
  Widget build(BuildContext context) {
    if (showAddButton) {
      List<TagModel<T>> tags = [
        TagModel(nameRol: 'All', item: null),
        ...tagList
      ];
      return _buildTagList(context, tags);
    }

    return _buildTagList(context, tagList);
  }

  _isSelected(String nameRol) =>
      selectedTag == nameRol ||
      (nameRol == 'All' && (selectedTag == null || selectedTag == ''));

  _customButton(TagModel<T> item) => SizedBox(
        height: itemHeight,
        child: TagButton(
          isSelected: _isSelected(item.nameRol),
          label: item.nameRol,
          onTap: () => onTap(item),
        ),
      );

  Widget _buildTagList(BuildContext context, List<TagModel<T>> tags) {
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      children: List.generate(
        tags.length + 1,
        (index) => index == tags.length && showAddButton
            ? _buildAddButton(context)
            : _customButton(tags[index]),
      ),
    );
  }

  SizedBox _buildAddButton(BuildContext context) {
    return SizedBox(
      width: 100,
      height: itemHeight,
      child: TagButton(
          onTap: () => onTapAdd(context), label: addText, isSelected: false),
    );
  }
}

class TagButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  final bool isSelected;
  final double? itemWidth;
  final double? fontSize;

  const TagButton({
    super.key,
    required this.onTap,
    required this.label,
    required this.isSelected,
    this.itemWidth,
    this.fontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _backgroundColor(context),
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: onTap,
        child: Container(
          decoration: _borderDecoration(context),
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Text(
              label,
              textAlign: TextAlign.start,
              style: context.secondaryText
                  .copyWith(color: _textColor(context), fontSize: fontSize),
            ),
          ),
        ),
      ),
    );
  }

  _backgroundColor(BuildContext context) {
    if (isSelected) return context.primaryColor;
    return context.surfaceContainerColor;
  }

  _textColor(BuildContext context) {
    if (isSelected) return context.surfaceContainerColor;
    return context.primaryColor;
  }

  _borderDecoration(BuildContext context) {
    if (isSelected) return BoxDecoration();
    return BoxDecoration(
      color: context.surfaceColor,
      border: Border.all(color: context.primaryColor, width: 1),
      borderRadius: BorderRadius.circular(4),
    );
  }
}

class TagModel<T> {
  final String nameRol;
  final T? item;
  TagModel({
    required this.nameRol,
    required this.item,
  });
}
