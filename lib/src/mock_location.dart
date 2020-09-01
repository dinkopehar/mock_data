import 'dart:math';

import 'constants.dart' show random;

final R = 6372800;

class Location {
  double lat;
  double lon;
  Location(this.lat, this.lon);
}

/// Generate random latitude longitude in `radius` from `centerLat` to `centerLon`, inclusive.
/// If any argument is null, random location will be returned.
Location mockLocation([double centerLat, double centerLon, int radius]) {

  if (centerLat == null || centerLon == null || radius == null) {
    return Location(random.nextDouble() * 90, random.nextDouble() * 180);
  }

  // Convert radius from meters to degrees
  double radiusInDegrees = radius / 111000.0;

  double u = random.nextDouble();
  double v = random.nextDouble();
  double w = radiusInDegrees * sqrt(u);
  double t = 2 * pi * v;
  double x = w * cos(t);
  double y = w * sin(t);

  // Adjust the x-coordinate for the shrinking of the east-west distances
  double new_x = x / cos(_toRadians(centerLat));

  double foundLongitude = new_x + centerLon;
  double foundLatitude = y + centerLat;

  return Location(foundLatitude, foundLongitude);
}

/// Distance between two locations calculated with Haversine formula.
double distance(double lat1, double lon1, double lat2, double lon2) {
  double dLat = _toRadians(lat2 - lat1);
  double dLon = _toRadians(lon2 - lon1);
  lat1 = _toRadians(lat1);
  lat2 = _toRadians(lat2);
  double a = pow(sin(dLat / 2), 2) + pow(sin(dLon / 2), 2) * cos(lat1) * cos(lat2);
  double c = 2 * asin(sqrt(a));
  return R * c;
}

double _toRadians(double degree) {
  return degree * pi / 180;
}