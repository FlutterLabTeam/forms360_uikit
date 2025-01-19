import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/map/custom_marker_icon.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  final LatLng initialLocation;
  final bool showControls;
  final bool hasMultipleMarkers;
  final Function(Map<MarkerId, Marker>) onSave;
  MapWidget(
    this.initialLocation, {
    this.showControls = true,
    this.hasMultipleMarkers = false,
    required this.onSave,
  });

  @override
  State<MapWidget> createState() => _MapWidgetState(initialLocation);
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController? _controller;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId? selectedMarker;
  int _markerIdCounter = 1;
  static LatLng? center;

  _MapWidgetState(LatLng? geoPoint) {
    if (geoPoint != null) {
      center = geoPoint;
    }
  }

  LatLng? markerPosition;

  Future<LatLng> getCenter() async {
    if (_controller == null) return center!;
    LatLngBounds visibleRegion = await _controller!.getVisibleRegion();
    LatLng centerLatLng = LatLng(
      (visibleRegion.northeast.latitude + visibleRegion.southwest.latitude) / 2,
      (visibleRegion.northeast.longitude + visibleRegion.southwest.longitude) /
          2,
    );

    return centerLatLng;
  }

  @override
  void initState() {
    super.initState();
    if (widget.initialLocation != null) {
      final MarkerId markerId = MarkerId('marker_id_$_markerIdCounter');
      _markerIdCounter++;
      final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(widget.initialLocation!.latitude,
            widget.initialLocation!.longitude),
        onTap: () => _onMarkerTapped(markerId),
        onDragEnd: (LatLng position) => _onMarkerDragEnd(markerId, position),
        onDrag: (LatLng position) => _onMarkerDrag(markerId, position),
        draggable: true,
      );
      markers[markerId] = marker;
      center = LatLng(
          widget.initialLocation!.latitude, widget.initialLocation!.longitude);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: 700,
      child: Stack(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: center ?? _kGooglePlex.target,
                  zoom: 11.0,
                ),
                markers: Set<Marker>.of(markers.values),
              ),
            ),
            Visibility(child: _buildControls(), visible: widget.showControls),
          ],
        ),
        Visibility(
          visible: markerPosition != null,
          child: Container(
            color: Colors.white70,
            height: 30,
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                if (markerPosition == null)
                  Container()
                else
                  Expanded(
                      child: Text(
                    'lat: ${markerPosition!.latitude}',
                    style: TextStyle(color: Colors.black),
                  )),
                if (markerPosition == null)
                  Container()
                else
                  Expanded(
                      child: Text(
                    'lng: ${markerPosition!.longitude}',
                    style: TextStyle(color: Colors.black),
                  )),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  buildControls() {
    return Column(
      children: <Widget>[
        TextButton(
          onPressed: _add,
          child: const Text('Add'),
        ),
        TextButton(
          onPressed:
              selectedMarker == null ? null : () => _remove(selectedMarker!),
          child: const Text('Remove'),
        ),
      ],
    );
  }

  Wrap buildButtons(MarkerId? selectedId, BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      children: <Widget>[
        TextButton(
          onPressed: selectedId == null ? null : () => _changeInfo(selectedId),
          child: const Text('change info'),
        ),
        TextButton(
          onPressed:
              selectedId == null ? null : () => _changeInfoAnchor(selectedId),
          child: const Text('change info anchor'),
        ),
        TextButton(
          onPressed: selectedId == null ? null : () => _changeAlpha(selectedId),
          child: const Text('change alpha'),
        ),
        TextButton(
          onPressed:
              selectedId == null ? null : () => _changeAnchor(selectedId),
          child: const Text('change anchor'),
        ),
        TextButton(
          onPressed:
              selectedId == null ? null : () => _toggleDraggable(selectedId),
          child: const Text('toggle draggable'),
        ),
        TextButton(
          onPressed: selectedId == null ? null : () => _toggleFlat(selectedId),
          child: const Text('toggle flat'),
        ),
        TextButton(
          onPressed:
              selectedId == null ? null : () => _changePosition(selectedId),
          child: const Text('change position'),
        ),
        TextButton(
          onPressed:
              selectedId == null ? null : () => _changeRotation(selectedId),
          child: const Text('change rotation'),
        ),
        TextButton(
          onPressed:
              selectedId == null ? null : () => _toggleVisible(selectedId),
          child: const Text('toggle visible'),
        ),
        TextButton(
          onPressed:
              selectedId == null ? null : () => _changeZIndex(selectedId),
          child: const Text('change zIndex'),
        ),
        TextButton(
          onPressed: selectedId == null
              ? null
              : () {
                  _getMarkerIcon(context).then(
                    (BitmapDescriptor icon) {
                      _setMarkerIcon(selectedId, icon);
                    },
                  );
                },
          child: const Text('set marker icon'),
        ),
      ],
    );
  }

  // ignore: use_setters_to_change_properties
  void _onMapCreated(GoogleMapController controller) {
    this._controller = controller;
  }

  void _onMarkerTapped(MarkerId markerId) {
    final Marker? tappedMarker = markers[markerId];
    if (tappedMarker != null) {
      setState(() {
        final MarkerId? previousMarkerId = selectedMarker;
        if (previousMarkerId != null && markers.containsKey(previousMarkerId)) {
          final Marker resetOld = markers[previousMarkerId]!
              .copyWith(iconParam: BitmapDescriptor.defaultMarker);
          markers[previousMarkerId] = resetOld;
        }
        selectedMarker = markerId;
        final Marker newMarker = tappedMarker.copyWith(
          iconParam: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
        );
        markers[markerId] = newMarker;

        markerPosition = null;
      });
    }
  }

  Future<void> _onMarkerDrag(MarkerId markerId, LatLng newPosition) async {
    setState(() {
      markerPosition = newPosition;
    });
  }

  Future<void> _onMarkerDragEnd(MarkerId markerId, LatLng newPosition) async {
    final Marker? tappedMarker = markers[markerId];
    if (tappedMarker != null) {
      setState(() {
        markerPosition = null;
      });
    }
  }

  Future<void> _add() async {
    if (!widget.hasMultipleMarkers) {
      markers.clear();
    }

    final String markerIdVal = 'marker_id_$_markerIdCounter';
    _markerIdCounter++;
    final MarkerId markerId = MarkerId(markerIdVal);
    var latLng = await getCenter();
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(
        latLng.latitude,
        latLng.longitude,
      ),
      draggable: true,
      onTap: () => _onMarkerTapped(markerId),
      onDragEnd: (LatLng position) => _onMarkerDragEnd(markerId, position),
      onDrag: (LatLng position) => _onMarkerDrag(markerId, position),
    );

    setState(() {
      markers[markerId] = marker;
      center = marker.position;
    });
  }

  void _remove(MarkerId markerId) {
    setState(() {
      if (markers.containsKey(markerId)) {
        markers.remove(markerId);
      }
    });
  }

  void _changePosition(MarkerId markerId) {
    final Marker marker = markers[markerId]!;
    final LatLng current = marker.position;
    final Offset offset = Offset(
      center!.latitude - current.latitude,
      center!.longitude - current.longitude,
    );
    setState(() {
      markers[markerId] = marker.copyWith(
        positionParam: LatLng(
          center!.latitude + offset.dy,
          center!.longitude + offset.dx,
        ),
      );
    });
  }

  void _changeAnchor(MarkerId markerId) {
    final Marker marker = markers[markerId]!;
    final Offset currentAnchor = marker.anchor;
    final Offset newAnchor = Offset(1.0 - currentAnchor.dy, currentAnchor.dx);
    setState(() {
      markers[markerId] = marker.copyWith(
        anchorParam: newAnchor,
      );
    });
  }

  Future<void> _changeInfoAnchor(MarkerId markerId) async {
    final Marker marker = markers[markerId]!;
    final Offset currentAnchor = marker.infoWindow.anchor;
    final Offset newAnchor = Offset(1.0 - currentAnchor.dy, currentAnchor.dx);
    setState(() {
      markers[markerId] = marker.copyWith(
        infoWindowParam: marker.infoWindow.copyWith(
          anchorParam: newAnchor,
        ),
      );
    });
  }

  Future<void> _toggleDraggable(MarkerId markerId) async {
    final Marker marker = markers[markerId]!;
    setState(() {
      markers[markerId] = marker.copyWith(
        draggableParam: !marker.draggable,
      );
    });
  }

  Future<void> _toggleFlat(MarkerId markerId) async {
    final Marker marker = markers[markerId]!;
    setState(() {
      markers[markerId] = marker.copyWith(
        flatParam: !marker.flat,
      );
    });
  }

  Future<void> _changeInfo(MarkerId markerId) async {
    final Marker marker = markers[markerId]!;
    final String newSnippet = '${marker.infoWindow.snippet!}*';
    setState(() {
      markers[markerId] = marker.copyWith(
        infoWindowParam: marker.infoWindow.copyWith(
          snippetParam: newSnippet,
        ),
      );
    });
  }

  Future<void> _changeAlpha(MarkerId markerId) async {
    final Marker marker = markers[markerId]!;
    final double current = marker.alpha;
    setState(() {
      markers[markerId] = marker.copyWith(
        alphaParam: current < 0.1 ? 1.0 : current * 0.75,
      );
    });
  }

  Future<void> _changeRotation(MarkerId markerId) async {
    final Marker marker = markers[markerId]!;
    final double current = marker.rotation;
    setState(() {
      markers[markerId] = marker.copyWith(
        rotationParam: current == 330.0 ? 0.0 : current + 30.0,
      );
    });
  }

  Future<void> _toggleVisible(MarkerId markerId) async {
    final Marker marker = markers[markerId]!;
    setState(() {
      markers[markerId] = marker.copyWith(
        visibleParam: !marker.visible,
      );
    });
  }

  Future<void> _changeZIndex(MarkerId markerId) async {
    final Marker marker = markers[markerId]!;
    final double current = marker.zIndex;
    setState(() {
      markers[markerId] = marker.copyWith(
        zIndexParam: current == 12.0 ? 0.0 : current + 1.0,
      );
    });
  }

  void _setMarkerIcon(MarkerId markerId, BitmapDescriptor assetIcon) {
    final Marker marker = markers[markerId]!;
    setState(() {
      markers[markerId] = marker.copyWith(
        iconParam: assetIcon,
      );
    });
  }

  Future<BitmapDescriptor> _getMarkerIcon(BuildContext context) async {
    const Size canvasSize = Size(48, 48);
    final ByteData bytes = await createCustomMarkerIconImage(size: canvasSize);
    return BytesMapBitmap(bytes.buffer.asUint8List());
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  _buildControls() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 250,
              child: FormsKit.widget.buttons.button(
                sizeButton: SizeButtonKit.big,
                onPressed: _add,
                title: 'Set',
              ),
            ),
            Container(
              width: 250,
              child: FormsKit.widget.buttons.button(
                sizeButton: SizeButtonKit.big,
                onPressed: () {
                  widget.onSave(markers);
                },
                title: 'Save',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
