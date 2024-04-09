import 'dart:math';

// Function to calculate the distance between two points using the Haversine formula
num calculateDistance(num lat1, num lon1, num lat2, num lon2) {
  const num earthRadius = 6371; // Radius of the earth in kilometers

  // Convert degrees to radians
  num toRadians(num degrees) {
    return degrees * pi / 180;
  }

  // Haversine formula
  num dLat = toRadians(lat2 - lat1);
  num dLon = toRadians(lon2 - lon1);

  num a = pow(sin(dLat / 2), 2) +
      cos(toRadians(lat1)) * cos(toRadians(lat2)) * pow(sin(dLon / 2), 2);
  num c = 2 * atan2(sqrt(a), sqrt(1 - a));

  return earthRadius * c; // Distance in kilometers
}

// Function to check if a destination point is within a specified radius of a source point
bool isWithinRadius(
    num destLat, num destLon, num sourceLat, num sourceLon, num radius) {
  // Calculate the distance between the source and destination points
  num distance = calculateDistance(sourceLat, sourceLon, destLat, destLon);

  // Check if the distance is less than or equal to the specified radius
  return distance <= radius;
}
