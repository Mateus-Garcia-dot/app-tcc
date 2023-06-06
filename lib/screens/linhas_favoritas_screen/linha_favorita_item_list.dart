import 'package:flutter/material.dart';

class LinhaFavoritaItemList extends StatelessWidget {
  const LinhaFavoritaItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  alignment: AlignmentDirectional.center,
                  width: 50,
                  height: 50,
                  child: const Icon(
                    Icons.directions_bus_filled,
                    size: 28,
                  )),
              Container(
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                      child: Text(
                        "Interbairros 2",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              desfavoritarLinha(context);
            },
            icon: const Icon(
              size: 18,
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  desfavoritarLinha(BuildContext context) {}
}
