import 'package:app_tcc/models/shapeLinha.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ConversorParaLatLng {
  static List<LatLng> fromArray(dynamic objetos) {
    List<LatLng> latLngs = [];

    for (var objeto in objetos) {
      var latLng = LatLng(objeto.lat, objeto.lng);
      latLngs.add(latLng);
    }

    return latLngs;
  }
}
