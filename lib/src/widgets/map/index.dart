import 'package:forms360_uikit/src/widgets/map/map_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps {
  map({
    required Function(Map<MarkerId, Marker>) onSave,
    required LatLng initialLocation,
    bool hasMultipleMarkers = false,
    bool showControls = true,
  }) {
    return MapWidget(
      initialLocation,
      onSave: onSave,
      hasMultipleMarkers: hasMultipleMarkers,
      showControls: showControls,
    );
  }
}
