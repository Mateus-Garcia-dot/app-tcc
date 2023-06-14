import 'package:app_tcc/models/linha.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../helpers/converter_lat_lng.dart';
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
            return Container(
              child: GoogleMap(
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

              ),
            );
          } else {
            return const Center(
              child: Text('Nenhum dado disponível'),
            );
          }
        },
      ),
    );
  }
}
