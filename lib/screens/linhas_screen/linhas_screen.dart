import 'package:flutter/material.dart';

import 'linha_item_list.dart';

class LinhasScreen extends StatelessWidget {
  const LinhasScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Linhas"),
      ),
      body: ListView(children: [
        LinhaItemList(),
        LinhaItemList(),
        LinhaItemList(),
      ]),
    );
  }
}
