import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:forms360_uikit/src/model/pop_up_model.dart';
import 'package:forms360_uikit/src/widgets/pop_up/frosted_glass.dart';

Future<dynamic> customPopUp(
  BuildContext context, {
  required Widget? header,
  required Widget body,
  required Widget footer,
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
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                header ??
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [buildCloseButton(context)],
                                    ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 64,
                                    horizontal: 64.0,
                                  ),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Expanded(child: body),
                                        footer,
                                      ],
                                    ),
                                    width: double.infinity,
                                  ),
                                )
                              ],
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
