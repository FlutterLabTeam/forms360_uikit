import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forms360_uikit/forms360_uikit.dart';

class EndContentWidget extends ConsumerStatefulWidget {
  final Function(String)? onSearch;
  final String searchLabel;
  final Widget content;
  final Widget? titleWidget;
  const EndContentWidget(
      {Key? key,
      this.onSearch,
      this.searchLabel = 'Search',
      this.titleWidget,
      required this.content})
      : super(key: key);

  @override
  _EndContentWidgetState createState() => _EndContentWidgetState();
}

class _EndContentWidgetState extends ConsumerState<EndContentWidget> {
  SearchController searchController = SearchController();

  @override
  void initState() {
    super.initState();
    if (widget.onSearch != null) {
      searchController.addListener(() {
        widget.onSearch!(searchController.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSearch(),
        SizedBox(height: 20),
        ...buildContentTitle(),
        SizedBox(height: 20),
        Expanded(child: widget.content),
      ],
    );
  }

  buildContentTitle() {
    return widget.titleWidget != null
        ? [
            widget.titleWidget!,
            SizedBox(height: 10),
          ]
        : [Container()];
  }

  Widget buildSearch() {
    return FormsKit.widget.inputs.searchInput(
      label: widget.searchLabel,
      controller: searchController,
      hintText: widget.searchLabel,
    );
  }
}
