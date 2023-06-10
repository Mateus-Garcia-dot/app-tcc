import 'package:flutter/material.dart';

import 'itinerario_list_item.dart';

class ItinerarioList extends StatelessWidget {
  const ItinerarioList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      ItinerarioListItem(),
      ItinerarioListItem(),
      ItinerarioListItem(),
      ItinerarioListItem(),
      ItinerarioListItem(),
      ItinerarioListItem(),
      ItinerarioListItem(),
    ]);
  }
}
