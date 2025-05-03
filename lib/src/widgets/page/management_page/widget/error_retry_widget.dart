import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';

class ErrorRetryWidget extends StatelessWidget {
  final String errorMessage;
  final String retryButtonText;
  final Color textColor;
  final VoidCallback onRetry;

  const ErrorRetryWidget({
    super.key,
    required this.errorMessage,
    required this.onRetry,
    this.textColor = Colors.black,
    this.retryButtonText = 'Retry',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: context.sizeWidth() * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              errorMessage,
              style: context.primaryText,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Container(
              width: 200,
              child: FormsKit.widget.buttons.button(
                onPressed: onRetry,
                title: retryButtonText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
