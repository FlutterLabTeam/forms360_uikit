import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/widgets/pop_up/frosted_glass.dart';
import 'package:go_router/go_router.dart';

Future<dynamic> generalPopUp(
    BuildContext context, {
      required Widget child,
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
                                    IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          color: Theme.of(context).colorScheme.primary,
                                        ),
                                        onPressed: () => context.pop(context))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 64,
                                    horizontal: 64.0,
                                  ),
                                  child: Container(
                                    child: child,
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
