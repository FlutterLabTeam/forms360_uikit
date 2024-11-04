import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    super.key,
    required this.data,
    this.loadingWidget,
    required this.value,
  });

  final AsyncValue<T> value;
  final Widget? loadingWidget;
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (e, st) => Center(child: Text(e.toString())),
      loading: () => loadingWidget != null
          ? loadingWidget!
          : Center(child: CircularProgressIndicator(color: Colors.white)),
    );
  }
}
