import 'package:flutter/material.dart';

import '../../models/linha.dart';
import '../commom/conversor_cores.dart';

class LinhaItemList extends StatelessWidget {
  final Linha? linha;

  const LinhaItemList({Key? key, this.linha}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color cor = ConversorCores.fromString(linha!.NOME_COR);

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
                alignment: AlignmentDirectional.center,
                width: 50,
                height: 50,
                child: IconTheme(
                    data: IconThemeData(color: cor),
                    child: Icon(
                      Icons.directions_bus_filled,
                      size: 24,
                      color: cor,
                    ))),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                    child: Text(
                      linha!.NOME,
                      style: const TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(linha!.COD),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
