import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/pop_up/pop_up_index.dart';
import 'package:forms360_uikit/src/model/pop_up_model.dart';

@widgetbook.UseCase(
  name: 'Tabbed PopUp',
  type: PopUpIndex,
)
Widget tabbedPopUpUseCase(BuildContext context) {
  final pageController = PageController();
  return Center(
    child: FormsKit.widget.buttons.button(
      title: 'Abrir Tabbed PopUp',
      onPressed: () {
        PopUpIndex().tabbed(
          context,
          popUpSize: PopUpSize.MEDIUM,
          footers: [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
          ],
          children: [
            Center(child: Text('Contenido Tab 1')),
            Center(child: Text('Contenido Tab 2')),
          ],
          pageController: pageController,
        );
      },
    ),
  );
}

@widgetbook.UseCase(
  name: 'Tabbed PopUp - Con Botones',
  type: PopUpIndex,
)
Widget tabbedPopUpWithButtonsUseCase(BuildContext context) {
  final pageController = PageController();
  return Center(
    child: FormsKit.widget.buttons.button(
      title: 'Abrir Tabbed PopUp con Botones',
      onPressed: () {
        PopUpIndex().tabbed(
          context,
          popUpSize: PopUpSize.MEDIUM,
          footers: [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
          ],
          children: [
            Center(child: Text('Contenido Tab 1')),
            Center(child: Text('Contenido Tab 2')),
          ],
          pageController: pageController,
        );
      },
    ),
  );
}
