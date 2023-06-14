import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';


 Future<void> obterLocalizacaoPeriodica() async {
   await Permission.location.request();

   StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
     desiredAccuracy: LocationAccuracy.high,
   ).listen((Position position) {
     double latitude = position.latitude;
     double longitude = position.longitude;
     print('Latitude: $latitude, Longitude: $longitude');
   });

   LocationPermission permission = await Geolocator.checkPermission();
   if (permission == LocationPermission.denied) {
     permission = await Geolocator.requestPermission();
   }

   if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
     Position position = await Geolocator.getCurrentPosition();
     double latitude = position.latitude;
     double longitude = position.longitude;
     print('Latitude: $latitude, Longitude: $longitude');
   }
}
