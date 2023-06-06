import 'package:app_tcc/screens/itinerario_screen/itinarerio_list.dart';
import 'package:flutter/material.dart';


class ItinerarioScreen extends StatelessWidget {
  const ItinerarioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Itinerário"),
      ),
      body: ItinerarioList()
    );
  }
}
