import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/inputs/primary_input.dart';
import 'package:forms360_uikit/src/model/input_types.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: PrimaryInput,
)
Widget defaultPrimaryInput(BuildContext context) {
  final controller = TextEditingController();

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: PrimaryInput(
      label: 'Nombre',
      hintText: 'Ingrese su nombre',
      isBig: false,
      enabled: true,
      isPassword: false,
      inputColor: PrimaryInputColorKit.BLUE,
      controller: controller,
      onChanged: (value) {
        print('Valor cambiado: $value');
      },
    ),
  );
}

@widgetbook.UseCase(
  name: 'Con Icono',
  type: PrimaryInput,
)
Widget primaryInputWithIcon(BuildContext context) {
  final controller = TextEditingController();

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: PrimaryInput(
      label: 'Contraseña',
      hintText: 'Ingrese su contraseña',
      isBig: false,
      enabled: true,
      isPassword: true,
      inputColor: PrimaryInputColorKit.BLUE,
      controller: controller,
      onChanged: (value) {
        print('Valor cambiado: $value');
      },
    ),
  );
}

@widgetbook.UseCase(
  name: 'Deshabilitado',
  type: PrimaryInput,
)
Widget disabledPrimaryInput(BuildContext context) {
  final controller = TextEditingController();

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: PrimaryInput(
      label: 'Campo Deshabilitado',
      hintText: 'No se puede editar',
      isBig: false,
      enabled: false,
      isPassword: false,
      inputColor: PrimaryInputColorKit.BLUE,
      controller: controller,
      onChanged: (value) {
        print('Valor cambiado: $value');
      },
    ),
  );
}
