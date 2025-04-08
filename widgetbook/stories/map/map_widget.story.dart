import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/map/index.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: Maps,
)
Widget mapWidgetDefault(BuildContext context) {
  return Center(
    child: Maps().map(
      onSave: (markers) {},
      initialLocation: const LatLng(0, 0),
    ),
  );
}
