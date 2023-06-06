import 'package:app_tcc/screens/linhas_favoritas_screen/linha_favorita_item_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LinhasFavoritasScreen extends StatelessWidget {
  const LinhasFavoritasScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Linhas favoritas"),
      ),
      body: ListView(children: [
        LinhaFavoritaItemList(),
        LinhaFavoritaItemList(),
        LinhaFavoritaItemList(),
      ]),
    );
  }
}
