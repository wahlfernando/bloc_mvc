import 'package:bloc_mvc/src/models/item_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' show Client;

class MoveApiProvider {
  Client client = Client();
  var _url = Uri.parse(
      'http://api.themoviedb.org/3/movie/popular?api_key=30b092961aedd38b1de1ecc15f61efad');

  Future<ItemModel> fetchMovieList() async {
    print("Entrou");

    final response = await client.get(_url);

    print(response.body.toString());

    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha na requisição');
    }
  }
}
