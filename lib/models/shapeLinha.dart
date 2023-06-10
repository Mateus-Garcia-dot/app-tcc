class ShapeLinha {
  double lng;
  double lat;

  ShapeLinha({
    required this.lng,
    required this.lat,
  });


  ShapeLinha.fromMap(Map<String, dynamic> map)
      : lng = map['lng'],
        lat = map['lat'];

  @override
  String toString() {
    return "lng: $lng lat: $lat";
  }

  Map<String, dynamic> toMap() {
    return {
      'lng': lng,
      'lat': lat,
    };
  }
}
