import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/page/management_page/widget/error_retry_widget.dart';

class EndContentWidget extends ConsumerStatefulWidget {
  final Function(String)? onSearch;
  final String searchLabel;
  final Widget content;
  final Widget? titleWidget;
  final String? retryButtonText;
  final bool isLoading;
  final String? errorMessage;
  final Function retryCallback;

  const EndContentWidget(
      {super.key,
      this.onSearch,
      this.searchLabel = 'Search',
      this.retryButtonText = 'Retry',
      this.titleWidget,
      this.errorMessage,
      this.isLoading = false,
      required this.content,
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
        buildSearch(),
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
    return FormsKit.widget.inputs.searchInput(
      label: widget.searchLabel,
      controller: searchController,
      hintText: widget.searchLabel,
    );
  }
}
