import 'package:flutter/material.dart';

import '../../models/linha.dart';
import '../rota_linha_screen/rota_linha_screen.dart';

class LinhaItemList extends StatefulWidget {
  final Linha? linha;

  const LinhaItemList({Key? key, this.linha}) : super(key: key);

  @override
  State<LinhaItemList> createState() => _LinhaItemListState();
}

class _LinhaItemListState extends State<LinhaItemList> {
  @override
  bool favoritado = false;

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RotaLinhaScreen(linha: widget.linha,),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
                alignment: AlignmentDirectional.center,
                width: 50,
                height: 50,
                child: const Icon(
                  Icons.directions_bus_filled,
                  size: 24,
                )),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                    child: Text(
                      widget.linha!.NOME,
                      style: const TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(widget.linha!.COD),
                ],
              ),
            ),
            IconButton(
              onPressed: () => {
                setState(() {
                  favoritado = !favoritado;
                })
              },
              icon: Icon(
                favoritado ? Icons.favorite : Icons.favorite_border,
                size: 16,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
