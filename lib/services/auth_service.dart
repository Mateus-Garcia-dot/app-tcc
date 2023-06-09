import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'web_client.dart';

class AuthService {
  http.Client client = WebClient().client;

  Future<String> login(String email, String password) async {
    http.Response response = await client.post(
      Uri.parse("${WebClient.url}logar"),
      body: {"login": email, "senha": password},
    );

    if (response.statusCode != 200) {
      if (json.decode(response.body).toString() == "Cannot find user") {
        throw UserNotFoundException();
      }

      throw HttpException(response.body.toString());
    }

    return saveInfosFromResponse(response.body);
  }

  Future<String> register(String email, String password) async {
    http.Response response = await client.post(
      Uri.parse("${WebClient.url}cadastrar"),
      body: {"email": email, "password": password},
    );

    if (response.statusCode != 201) {
      throw HttpException(response.body.toString());
    }

    return saveInfosFromResponse(response.body);
  }

  Future<String> saveInfosFromResponse(String body) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    Map<String, dynamic> map = json.decode(body);

    //sharedPreferences.setString("accessToken", map["accessToken"]);
    sharedPreferences.setString("_id", map["usuario"]["_id"].toString());
    sharedPreferences.setString("login", map["usuario"]["login"]);

    return map["usuario"]["login"];
  }
}

class UserNotFoundException implements Exception {}
