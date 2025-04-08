import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/pop_up/pop_up_index.dart';
import 'package:forms360_uikit/src/model/pop_up_model.dart';

@widgetbook.UseCase(
  name: 'Delete Custom PopUp',
  type: PopUpIndex,
)
Widget deleteCustomPopUpUseCase(BuildContext context) {
  return Center(
    child: FormsKit.widget.buttons.button(
      title: 'Abrir Delete PopUp',
      onPressed: () {
        PopUpIndex().general(
          context,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('¿Estás seguro de que deseas eliminar este elemento?'),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Aquí iría la lógica de eliminación
                    },
                    child: Text('Eliminar'),
                  ),
                ],
              ),
            ],
          ),
          popUpSize: PopUpSize.SHORT,
        );
      },
    ),
  );
}

@widgetbook.UseCase(
  name: 'Delete Custom PopUp - Con Mensaje Largo',
  type: PopUpIndex,
)
Widget deleteCustomPopUpLongMessageUseCase(BuildContext context) {
  return Center(
    child: FormsKit.widget.buttons.button(
      title: 'Abrir Delete PopUp con Mensaje Largo',
      onPressed: () {
        PopUpIndex().general(
          context,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  '¿Estás seguro de que deseas eliminar este elemento? Esta acción no se puede deshacer y todos los datos asociados se perderán permanentemente.'),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Aquí iría la lógica de eliminación
                    },
                    child: Text('Eliminar'),
                  ),
                ],
              ),
            ],
          ),
          popUpSize: PopUpSize.MEDIUM,
        );
      },
    ),
  );
}
