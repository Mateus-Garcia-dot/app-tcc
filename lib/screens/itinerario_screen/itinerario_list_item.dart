import 'package:flutter/material.dart';

class ItinerarioListItem extends StatelessWidget {
  const ItinerarioListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  alignment: AlignmentDirectional.center,
                  width: 40,
                  height: 40,
                  child: const Icon(
                    Icons.pin_drop_rounded,
                    size: 24,
                  )),
              Container(
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Av. Iguaçu, 462 - Rebouças",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            child: Text('10:30', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          )
        ],
      ),
    );
  }
}
