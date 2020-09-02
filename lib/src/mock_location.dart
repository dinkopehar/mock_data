import 'dart:math';

import 'constants.dart' show random;

final R = 6372800;

/// Generate random latitude longitude in `radius` from `centerLat` to `centerLon`, inclusive.
/// If any argument is null, random location will be returned.
Map<String, double> mockLocation([double latitude, double longitude, int radius]) {
  Map<String, double> location = Map();

  if (latitude == null || longitude == null || radius == null) {
    location['lat'] = random.nextDouble() * 90 * (random.nextBool() ? 1 : -1);
    location['lon'] = random.nextDouble() * 180 * (random.nextBool() ? 1 : -1);
  } else {
    // Convert radius from meters to degrees
    double radiusInDegrees = radius / 111000.0;

    double u = random.nextDouble();
    double v = random.nextDouble();
    double w = radiusInDegrees * sqrt(u);
    double t = 2 * pi * v;
    double x = w * cos(t);
    double y = w * sin(t);

    // Adjust the x-coordinate for the shrinking of the east-west distances
    location['lon'] = x / cos(_toRadians(latitude)) + longitude;
    location['lat'] = y + latitude;
  }

  return location;
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