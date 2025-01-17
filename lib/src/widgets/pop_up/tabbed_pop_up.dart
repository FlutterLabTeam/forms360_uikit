import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/model/pop_up_model.dart';
import 'package:forms360_uikit/src/widgets/pop_up/frosted_glass.dart';

Future<dynamic> tabbedPopUp(
  BuildContext context, {
  required PageController pageController,
  required List<Widget> children,
  required PopUpSize popUpSize,
  required List<Widget> footers,
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
                        //height: MediaQuery.of(context).size.height * 0.9,
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
                              constraints: BoxConstraints(
                                maxHeight:
                                    MediaQuery.of(context).size.height * 0.8,
                              ),
                              child: TabbedWidget(
                                footers: footers,
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

class TabbedWidget extends StatefulWidget {
  final List<Widget> children;
  final List<Widget> footers;

  final PageController pageController;
  const TabbedWidget(
      {super.key,
      required this.children,
      required this.footers,
      required this.pageController});

  @override
  TabbedWidgetState createState() => TabbedWidgetState();
}

class TabbedWidgetState extends State<TabbedWidget> {
  int _currentPage = 0;

  @override
  void dispose() {
    widget.pageController.dispose();
    super.dispose();
  }

  nextPage() {
    if (_currentPage < widget.children.length - 1) {
      widget.pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  previousPage() {
    if (_currentPage > 0) {
      widget.pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopUpBodyTemplate(
        title: buildNavigatorUi(context),
        body: Column(
          children: [
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
        ),
        footer: widget.footers[_currentPage]);
  }

  Container buildNavigatorUi(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _currentPage == 0
              ? Container()
              : IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: previousPage,
                ),
          Expanded(
            child: _currentPage == 0
                ? Container()
                : CustomPageIndicator(
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
    );
  }
}

class PopUpBodyTemplate extends StatelessWidget {
  final Widget? title;

  final Widget body;

  final Widget? footer;

  const PopUpBodyTemplate({
    super.key,
    this.title,
    required this.body,
    required this.footer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
      child: Column(
        children: [
          Container(
            child: title ?? Container(),
            // color: Colors.blueAccent,
          ),
          Expanded(
            child: body,
          ),
          footer == null
              ? Container()
              : SizedBox(
                  height: 40,
                  child: Container(
                    constraints: BoxConstraints(minHeight: 200),
                    child: footer,
                    // color: Colors.red,
                  )),
        ],
      ),
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
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
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
