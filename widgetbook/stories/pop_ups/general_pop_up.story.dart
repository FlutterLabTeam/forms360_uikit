import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/model/pop_up_model.dart';
import 'package:forms360_uikit/src/widgets/pop_up/pop_up_index.dart';

@widgetbook.UseCase(
  name: 'General PopUp',
  type: PopUpIndex,
)
Widget generalPopUpUseCase(BuildContext context) {
  return Center(
    child: FormsKit.widget.buttons.button(
      title: 'Abrir PopUp',
      onPressed: () {
        PopUpIndex().general(
          context,
          child: Text('Contenido del PopUp'),
          popUpSize: PopUpSize.MEDIUM,
        );
      },
    ),
  );
}

@widgetbook.UseCase(
  name: 'General PopUp - Largo',
  type: PopUpIndex,
)
Widget generalPopUpLongUseCase(BuildContext context) {
  return Center(
    child: FormsKit.widget.buttons.button(
      title: 'Abrir PopUp Largo',
      onPressed: () {
        PopUpIndex().general(
          context,
          child: Text('Contenido del PopUp Largo'),
          popUpSize: PopUpSize.LONG,
        );
      },
    ),
  );
}

@widgetbook.UseCase(
  name: 'General PopUp - Corto',
  type: PopUpIndex,
)
Widget generalPopUpShortUseCase(BuildContext context) {
  return Center(
    child: FormsKit.widget.buttons.button(
      title: 'Abrir PopUp Corto',
      onPressed: () {
        PopUpIndex().general(
          context,
          child: Text('Contenido del PopUp Corto'),
          popUpSize: PopUpSize.SHORT,
        );
      },
    ),
  );
}
