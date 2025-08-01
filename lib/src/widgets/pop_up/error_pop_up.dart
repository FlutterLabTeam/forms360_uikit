import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/pop_up/frosted_glass.dart';
import 'package:go_router/go_router.dart';

Future<dynamic> showErrorPopUp(
  BuildContext context, {
  required String okText,
  required String message,
  bool barrierDismissible = true,
  PlatformAlertType? platform = PlatformAlertType.MOBILE,
}) async {
  return await showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                FrostedGlassBox(
                  barrierDismissible: barrierDismissible,
                  theWidth: MediaQuery.of(context).size.width,
                  theHeight: MediaQuery.of(context).size.height,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 5,
                        constraints: BoxConstraints(
                          maxWidth: 600,
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    barrierDismissible
                                        ? IconButton(
                                            icon: Icon(
                                              Icons.close,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                            onPressed: () =>
                                                context.pop(context))
                                        : Container()
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 64,
                                    horizontal: 64.0,
                                  ),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.error,
                                          color: context.errorColor,
                                          size: platform == PlatformAlertType.MOBILE ? 50 : 100,
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          message,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: context.primaryColor,
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(height: 40),
                                        FormsKit.widget.buttons.button(
                                          title: okText,
                                          onPressed: () => context.pop(),
                                        )
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
