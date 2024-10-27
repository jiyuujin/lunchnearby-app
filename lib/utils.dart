pointToLatLng(String point) {
  final regex = RegExp(r'POINT\((.*) (.*)\)');
  final match = regex.firstMatch(point);
  if (match == null) {
    throw Exception('Invalid LatLng string: $point');
  }
  return {
    'latitude': double.parse(match.group(2)!),
    'longitude': double.parse(match.group(1)!)
  };
}
