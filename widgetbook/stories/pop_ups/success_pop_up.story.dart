import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/pop_up/pop_up_index.dart';

@widgetbook.UseCase(
  name: 'Success PopUp',
  type: PopUpIndex,
)
Widget successPopUpUseCase(BuildContext context) {
  return Center(
    child: FormsKit.widget.buttons.button(
      title: 'Mostrar Éxito',
      onPressed: () {
        PopUpIndex().successPopUp(
          context,
          message: '¡Operación completada con éxito!',
          okText: 'Aceptar',
        );
      },
    ),
  );
}

@widgetbook.UseCase(
  name: 'Success PopUp - Mensaje Largo',
  type: PopUpIndex,
)
Widget successPopUpLongMessageUseCase(BuildContext context) {
  return Center(
    child: FormsKit.widget.buttons.button(
      title: 'Mostrar Éxito con Mensaje Largo',
      onPressed: () {
        PopUpIndex().successPopUp(
          context,
          message:
              '¡Operación completada con éxito! Este es un mensaje más largo que se ajustará automáticamente al tamaño del pop-up.',
          okText: 'Aceptar',
        );
      },
    ),
  );
}
