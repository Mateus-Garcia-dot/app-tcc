import 'package:app_tcc/models/shapeLinha.dart';
import 'package:app_tcc/services/web_client.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/linha.dart';

class LinhasService {
  static const String resource = "linhas/";

  http.Client client = WebClient().client;

  String getURL() {
    return "${WebClient.url}$resource";
  }

  Uri getUri() {
    return Uri.parse(getURL());
  }

  Future<Linha> buscarLinhaPorCod(String cod) async {
    http.Response response = await client.get(
      Uri.parse("${getURL()}$cod"),
      headers: {
        'Content-type': 'application/json',
      },
    );

    dynamic jsonMap = json.decode(response.body);
    Linha linha = Linha.fromMap(jsonMap);

    return linha;
  }

  Future<List<Linha>> listarLinhas() async {
    Uri uri = Uri.parse("${WebClient.url}linhas");

    http.Response response = await client.get(
      uri,
      headers: {
        'Content-type': 'application/json',
      },
    );

    List<Linha> result = [];

    List<dynamic> jsonList = json.decode(response.body);
    for (var jsonMap in jsonList) {
      result.add(Linha.fromMap(jsonMap));
    }

    return result;
  }

  Future<List<ShapeLinha>> buscarShapeLinha(String codLinha) async {
    Uri uri = Uri.parse("${WebClient.url}linhas/shape/$codLinha");

    http.Response response = await client.get(
      uri,
      headers: {
        'Content-type': 'application/json',
      },
    );

    List<ShapeLinha> result = [];

    List<dynamic> jsonList = json.decode(response.body);
    for (var jsonMap in jsonList) {
      result.add(ShapeLinha.fromMap(jsonMap));
    }

    return result;
  }

}

