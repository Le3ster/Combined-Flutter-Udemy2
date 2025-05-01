import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:favorite_places/models/place.dart';

/// A screen to display a map for selecting or viewing a location.
class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.location = const PlaceLocation(
      latitude: 37.422,
      longitude: -122.084,
      address: '',
    ),
    this.isSelecting = true,
  });

  final PlaceLocation location;
  final bool isSelecting;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;

  void _selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  void _savePickedLocation() {
    if (_pickedLocation == null) return;
    Navigator.of(context).pop(_pickedLocation);
  }

  @override
  Widget build(BuildContext context) {
    final isSelecting = widget.isSelecting;
    final initialLatLng = LatLng(
      widget.location.latitude,
      widget.location.longitude,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(isSelecting ? 'Pick your Location' : 'Your Location'),
        actions: [
          if (isSelecting)
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: _savePickedLocation,
            ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: initialLatLng,
          zoom: 16,
        ),
        onTap: isSelecting ? _selectLocation : null,
        markers: (isSelecting && _pickedLocation == null)
            ? {}
            : {
          Marker(
            markerId: const MarkerId('m1'),
            position: _pickedLocation ?? initialLatLng,
          ),
        },
      ),
    );
  }
}
