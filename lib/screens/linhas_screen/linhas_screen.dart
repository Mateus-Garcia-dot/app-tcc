import 'package:app_tcc/models/linha.dart';
import 'package:app_tcc/services/linha_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'linha_item_list.dart';

class LinhasScreen extends StatelessWidget {
  const LinhasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final linhaService = Provider.of<LinhasService>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Linhas"),
        ),
        body: FutureBuilder<List<Linha>>(
          future: linhaService.listarLinhas(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final results = snapshot.data;

              return ListView.separated(
                itemCount: results!.length,
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.grey,
                    height: 1,
                  );
                },
                itemBuilder: (context, index) {
                  final linha = results?[index];
                  return LinhaItemList(linha: linha);
                },
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            return CircularProgressIndicator();
          },
        ));
  }
}
