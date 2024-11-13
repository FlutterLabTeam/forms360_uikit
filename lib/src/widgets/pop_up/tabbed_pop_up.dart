import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:forms360_uikit/src/model/pop_up_model.dart';
import 'package:forms360_uikit/src/widgets/pop_up/frosted_glass.dart';

Future<dynamic> tabbedPopUp(
  BuildContext context, {
  required PageController pageController,
  required List<Widget> children,
  required PopUpSize popUpSize,
}) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                FrostedGlassBox(
                  theWidth: MediaQuery.of(context).size.width,
                  theHeight: MediaQuery.of(context).size.height,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 5,
                        constraints: BoxConstraints(
                          maxWidth: generateSize(popUpSize),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(26),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(26.0),
                          child: SingleChildScrollView(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.8,
                              child: TabbedWidget(
                                pageController: pageController,
                                children: children,
                              ),
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      );
    },
  );
}

abstract class TabPageController {
  void nextPage();
  void previousPage();
}

class TabbedWidget extends StatefulWidget {
  final List<Widget> children;
  final PageController pageController;
  const TabbedWidget(
      {super.key, required this.children, required this.pageController});

  @override
  TabbedWidgetState createState() => TabbedWidgetState();
}

class TabbedWidgetState extends State<TabbedWidget>
    implements TabPageController {
  int _currentPage = 0;

  @override
  void dispose() {
    widget.pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (_currentPage < widget.children.length - 1) {
      widget.pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (_currentPage > 0) {
      widget.pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: previousPage,
            ),
            Expanded(
              child: CustomPageIndicator(
                currentPage: _currentPage,
                pageCount: widget.children.length, // Number of pages
              ),
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        ),
        Expanded(
          child: PageView(
            controller: widget.pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: widget.children,
          ),
        ),
      ],
    );
  }
}

class CustomPageIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const CustomPageIndicator({
    Key? key,
    required this.currentPage,
    required this.pageCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.0,
      margin: EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: List.generate(pageCount, (index) {
          return Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              height: 4.0,
              color: index == currentPage
                  ? Theme.of(context).primaryColor
                  : Colors.grey[300],
            ),
          );
        }),
      ),
    );
  }
}

buildTabLines(BuildContext context, PageController pageController,
    List<Widget> children) {
  return Row(
    children: List.generate(
      children.length,
      (index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 5,
          width: 20,
          decoration: BoxDecoration(
            color: pageController.page == index
                ? Theme.of(context).colorScheme.primary
                : Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
  );
}

buildBackButton(BuildContext context, PageController pageController) {
  if (pageController.page == 0) return Container();
  return IconButton(
    icon: Icon(
      Icons.arrow_back_ios,
      color: Theme.of(context).colorScheme.primary,
    ),
    onPressed: () {
      if (pageController.page!.toInt() == 0) {
        context.pop(context);
      } else {
        pageController.previousPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    },
  );
}

Row buildCloseButton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      IconButton(
          icon: Icon(
            Icons.close,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () => context.pop(context))
    ],
  );
}

double generateSize(PopUpSize popUpSize) {
  switch (popUpSize) {
    case PopUpSize.LONG:
      return 1300;
    case PopUpSize.MEDIUM:
      return 900;
    case PopUpSize.SHORT:
      return 600;
  }
}
