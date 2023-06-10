import 'package:app_tcc/models/linha.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../helpers/converterParaLatLng.dart';
import '../../models/shapeLinha.dart';
import '../../services/linha_service.dart';

class RotaLinhaScreen extends StatefulWidget {
  final Linha? linha;

  const RotaLinhaScreen({Key? key, this.linha}) : super(key: key);

  @override
  State<RotaLinhaScreen> createState() => _RotaLinhaScreenScreen();
}

class _RotaLinhaScreenScreen extends State<RotaLinhaScreen> {
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
    final theme = Theme.of(context);
    final linhaService = Provider.of<LinhasService>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.linha!.NOME),
          backgroundColor: theme.appBarTheme.backgroundColor,
        ),
        body: FutureBuilder<List<ShapeLinha>>(
          future: linhaService.buscarShapeLinha(widget.linha!.COD),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Erro ao carrel a rota'),
              );
            } else if (snapshot.hasData) {
              final shapeRota = snapshot.data!;
              return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(shapeRota.last.lat, shapeRota.last.lng),
                  zoom: 16.0,
                ),
                polylines: {
                  Polyline(
                    polylineId: PolylineId('rota'),
                    points: ConversorParaLatLng.fromArray(shapeRota),
                    color: Colors.black,
                    width: 3,
                  ),
                },
              );
            } else {
              return const Center(
                child: Text('Nenhum dado disponível'),
              );
            }
          },
        ),
    );
        // Column(
        //   children: [
        //     LayoutBuilder(
        //       builder: (BuildContext context, BoxConstraints constraints) {
        //         final screenHeight = MediaQuery.of(context).size.height;
        //         const porcentagem = 0.5;
        //         final widgetHeight = screenHeight * porcentagem;
        //
        //         return SizedBox(
        //           height: widgetHeight,
        //           child: GoogleMap(
        //             onMapCreated: _onMapCreated,
        //             initialCameraPosition: CameraPosition(
        //               target: _center,
        //               zoom: 15.0,
        //             ),
        //             polylines: _polylines,
        //           ),
        //         );
        //       },
        //     ),
        //   ],
        // ));
  }
}
