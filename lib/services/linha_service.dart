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

  Future<bool> buscarLinhaPorCod(String cod) async {
    http.Response response = await client.get(
      Uri.parse("${getURL()}$cod"),
      headers: {
        'Content-type': 'application/json',
      },
    );

    return true;
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

}

