import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/inputs/primary_date_input.dart';
import 'package:forms360_uikit/src/model/input_types.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: PrimaryDateInput,
)
Widget defaultPrimaryDateInput(BuildContext context) {
  final controller = TextEditingController();

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: PrimaryDateInput(
      label: 'Fecha',
      hintText: 'Selecciona una fecha',
      controller: controller,
      onTap: () {
        // Aquí iría la lógica para mostrar el date picker
        print('Date picker tapped');
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor selecciona una fecha';
        }
        return null;
      },
    ),
  );
}

@widgetbook.UseCase(
  name: 'Con Botón de Limpiar',
  type: PrimaryDateInput,
)
Widget primaryDateInputWithClearButton(BuildContext context) {
  final controller = TextEditingController(text: '2024-01-15');

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: PrimaryDateInput(
      label: 'Fecha de nacimiento',
      hintText: 'DD/MM/YYYY',
      controller: controller,
      isClearButtonVisible: true,
      onTap: () {
        print('Date picker tapped');
      },
      onTapOutside: () {
        print('Clear button pressed');
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor selecciona una fecha';
        }
        return null;
      },
    ),
  );
}

@widgetbook.UseCase(
  name: 'Deshabilitado',
  type: PrimaryDateInput,
)
Widget disabledPrimaryDateInput(BuildContext context) {
  final controller = TextEditingController(text: '2024-01-15');

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: PrimaryDateInput(
      label: 'Fecha (Deshabilitado)',
      hintText: 'No se puede editar',
      controller: controller,
      enabled: false,
      onTap: () {
        print('Date picker tapped');
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor selecciona una fecha';
        }
        return null;
      },
    ),
  );
}

@widgetbook.UseCase(
  name: 'Color Personalizado',
  type: PrimaryDateInput,
)
Widget primaryDateInputWithCustomColor(BuildContext context) {
  final controller = TextEditingController();

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: PrimaryDateInput(
      label: 'Fecha con color personalizado',
      hintText: 'Selecciona una fecha',
      controller: controller,
      inputColor: PrimaryInputColorKit.BLACK,
      onTap: () {
        print('Date picker tapped');
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor selecciona una fecha';
        }
        return null;
      },
    ),
  );
} 