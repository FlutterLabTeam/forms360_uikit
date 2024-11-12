import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/widgets/page/widget/responsive_two_column_layout.dart';

class UiPage {
  Widget standardPage({
    required Widget child,
    required String image,
    String labelPage = "",
  }) =>
      _StandardPage(
        child: child,
        image: image,
        labelPage: labelPage,
      );
}

class _StandardPage extends StatelessWidget {
  final String image;
  final Widget child;
  final String labelPage;

  const _StandardPage({
    required this.child,
    required this.image,
    required this.labelPage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveTwoColumnLayout(
        startContent: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Visibility(
                visible: labelPage.isNotEmpty,
                child: Center(
                  child: Text(
                    labelPage,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        spacing: 24,
        endContent: child,
      ),
    );
  }
}
