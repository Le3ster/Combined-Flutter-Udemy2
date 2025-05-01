import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/map.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onSelectLocation});

  final void Function(PlaceLocation location) onSelectLocation;

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocation? _pickedLocation;
  var _isGettingLocation = false;

  /// Returns a static map preview image URL from coordinates.
  String get locationImage {
    if (_pickedLocation == null) return '';
    final lat = _pickedLocation!.latitude;
    final lng = _pickedLocation!.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lng&key=YOUR_API_KEY';
  }

  /// Retrieves address from Google Geocoding API and updates state.
  Future<void> _savePlace(double latitude, double longitude) async {
    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=YOUR_API_KEY',
    );

    final response = await http.get(url);
    final resData = json.decode(response.body);

    if (resData['status'] != 'OK' || resData['results'].isEmpty) return;

    final address = resData['results'][0]['formatted_address'];

    setState(() {
      _pickedLocation = PlaceLocation(
        latitude: latitude,
        longitude: longitude,
        address: address,
      );
      _isGettingLocation = false;
    });

    widget.onSelectLocation(_pickedLocation!);
  }

  /// Attempts to get device's current location.
  void _getCurrentLocation() async {
    final location = Location();

    if (!await location.serviceEnabled() && !await location.requestService()) return;

    var permission = await location.hasPermission();
    if (permission == PermissionStatus.denied &&
        await location.requestPermission() != PermissionStatus.granted) return;

    setState(() => _isGettingLocation = true);

    final locationData = await location.getLocation();
    final lat = locationData.latitude;
    final lng = locationData.longitude;

    if (lat == null || lng == null) return;

    _savePlace(lat, lng);
  }

  /// Opens map screen and gets picked location from user.
  void _selectOnMap() async {
    final pickedLocation = await Navigator.of(context).push<LatLng>(
      MaterialPageRoute(builder: (ctx) => const MapScreen()),
    );

    if (pickedLocation == null) return;

    _savePlace(pickedLocation.latitude, pickedLocation.longitude);
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Text(
      'No location chosen',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: Theme.of(context).colorScheme.onBackground,
      ),
    );

    if (_isGettingLocation) {
      previewContent = const CircularProgressIndicator();
    } else if (_pickedLocation != null) {
      previewContent = Image.network(
        locationImage,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }

    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            ),
          ),
          child: previewContent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              icon: const Icon(Icons.location_on),
              label: const Text('Get Current Location'),
            ),
            TextButton.icon(
              onPressed: _selectOnMap,
              icon: const Icon(Icons.map),
              label: const Text('Select on Map'),
            ),
          ],
        )
      ],
    );
  }
}
