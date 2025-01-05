import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forms360_uikit/forms360_uikit.dart';

class AnimatedBarGraphListView extends ConsumerStatefulWidget {
  final Color? textColor;
  final Color? barColor;
  final Color? barTextColor;
  final Color? barBackgroundColor;
  final Map<String, double> data;
  final bool isSearchable;
  final String searchLabel;

  const AnimatedBarGraphListView({
    super.key,
    this.textColor,
    this.barColor,
    this.barTextColor,
    this.barBackgroundColor,
    this.isSearchable = false,
    this.searchLabel = '',
    required this.data,
  });

  @override
  _AnimatedBarGraphListViewState createState() =>
      _AnimatedBarGraphListViewState();
}

class _AnimatedBarGraphListViewState
    extends ConsumerState<AnimatedBarGraphListView> {
  final TextEditingController _searchController = TextEditingController();
  Map<String, double> _filteredData = {};
  String searchQuery = '';
  double max = 1;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterData);
    _filterData();
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterData);
    _searchController.dispose();
    super.dispose();
  }

  void _filterData() {
    setState(() {
      searchQuery = _searchController.text.toLowerCase();
      _filterDataAndSetMaxValue();
    });
  }

  void _filterDataAndSetMaxValue() {
    _filteredData = widget.data.entries.where((element) {
      return element.key.toLowerCase().contains(searchQuery);
    }).fold({}, (previousValue, element) {
      previousValue[element.key] = element.value;
      return previousValue;
    });
    max = _findTheFirstHighestValueInData();
  }

  @override
  Widget build(BuildContext context) {
    _filterDataAndSetMaxValue();
    return Column(
      children: [
        SizedBox(height: 10),
        if (widget.isSearchable)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: FormsKit.widget.inputs.searchInput(
              hintText: widget.searchLabel,
              label: widget.searchLabel,
              controller: _searchController,
            ),
          ),
        if (widget.isSearchable) SizedBox(height: 10),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(_filteredData.length, (index) {
            return buildItem(context, index, max);
          }),
        ),
      ],
    );
  }

  Container buildItem(BuildContext context, int index, double max) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: FormsKit.widget.graphs.animatedBar(
        max: max,
        itemName: _filteredData.keys.elementAt(index),
        itemValue: _filteredData.values.elementAt(index),
        textColor: widget.textColor ?? Theme.of(context).primaryColor,
        barColor: widget.barColor ?? Theme.of(context).primaryColor,
        barTextColor: widget.barTextColor ?? Theme.of(context).primaryColor,
        barBackgroundColor: widget.barBackgroundColor,
      ),
    );
  }

  double _findTheFirstHighestValueInData() {
    double max = 1;
    widget.data.forEach((key, value) {
      if (value > max) {
        max = value;
      }
    });
    return max;
  }
}
