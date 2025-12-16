import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forms360_uikit/src/widgets/page/management_page/widget/error_retry_widget.dart';

class EndContentWidget extends ConsumerStatefulWidget {
  final Function(String)? onSearch;
  final bool isLoading;
  final Widget content;
  final String searchLabel;
  final Widget? titleWidget;
  final String? errorMessage;
  final Function retryCallback;
  final String? retryButtonText;
  final List<Widget>? settingsWidgets;

  const EndContentWidget(
      {super.key,
      this.onSearch,
      this.titleWidget,
      this.errorMessage,
      this.settingsWidgets,
      required this.content,
      this.isLoading = false,
      this.searchLabel = 'Search',
      this.retryButtonText = 'Retry',
      required this.retryCallback});

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
        _buildSearchAndSettings(),
        SizedBox(height: 20),
        ...buildContentTitle(),
        Expanded(
          child: widget.isLoading
              ? Center(
                  child: Container(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator()))
              : widget.errorMessage == null
                  ? widget.content
                  : ErrorRetryWidget(
                      textColor: context.surfaceColor,
                      errorMessage: widget.errorMessage!,
                      onRetry: () {
                        widget.retryCallback();
                      },
                      retryButtonText: widget.retryButtonText!,
                    ),
        ),
      ],
    );
  }

  _buildSearchAndSettings() {
    if (widget.onSearch == null &&
        (widget.settingsWidgets == null || widget.settingsWidgets!.isEmpty)) {
      return Container();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget.onSearch != null ? buildSearch() : Container(),
        widget.onSearch != null ? SizedBox(width: 10) : Container(),
        if (widget.settingsWidgets != null &&
            widget.settingsWidgets!.isNotEmpty)
          Row(
              children: widget.settingsWidgets!
                  .map((widget) => Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: widget,
                      ))
                  .toList()),
      ],
    );
  }

  buildContentTitle() {
    return widget.titleWidget != null
        ? [
            SizedBox(height: 20),
            widget.titleWidget!,
            SizedBox(height: 10),
          ]
        : [Container()];
  }

  Widget buildSearch() {
    return Expanded(
      child: FormsKit.widget.inputs.searchInput(
        label: widget.searchLabel,
        controller: searchController,
        hintText: widget.searchLabel,
      ),
    );
  }
}
