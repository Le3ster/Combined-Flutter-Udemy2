import 'dart:io';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

/// Represents a geographical location with coordinates and an address.
class PlaceLocation {
  const PlaceLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  final double latitude;   // Latitude of the location
  final double longitude;  // Longitude of the location
  final String address;    // Human-readable address
}

/// Represents a user-defined place with a title, image, location, and unique ID.
class Place {
  Place({
    required this.location,
    required this.title,
    required this.image,
    String? id,
  }) : id = id ?? uuid.v4(); // Auto-generate ID if not provided

  final String id;             // Unique identifier
  final String title;          // Title or name of the place
  final File image;            // Image associated with the place
  final PlaceLocation location;// Geographical data of the place
}
