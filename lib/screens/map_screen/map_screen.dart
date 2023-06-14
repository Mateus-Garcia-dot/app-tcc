import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreen();
}

class _MapScreen extends State<MapScreen> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(-25.417419972874562, -49.269363993299066);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            child: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 15.0,
              ),
            ),
            Positioned(
              top: 10, // Posição vertical do campo de pesquisa
              left: 10, // Posição horizontal do campo de pesquisa
              right: 10,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Pesquise a linha',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
            ),
          ],
        )),
      ),
    );
  }
}
