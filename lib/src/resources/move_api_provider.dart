import 'package:bloc_mvc/src/models/item_model.dart';
import 'package:bloc_mvc/src/models/trailer_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' show Client;

class MoveApiProvider {
  Client client = Client();
  final _baseUrl = "http://api.themoviedb.org/3/movie";
  var _url = Uri.parse(
      'https://api.themoviedb.org/3/movie/popular?api_key=30b092961aedd38b1de1ecc15f61efad');

  Future<ItemModel> fetchMovieList() async {
    final response = await client.get(_url);

    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha na requisição');
    }
  }

  Future<TrailerModel> fetchTrailer(int movieId) async {
    var _url = Uri.parse("$_baseUrl/$movieId/videos?api_key=30b092961aedd38b1de1ecc15f61efad");
    final response =
    await client.get(_url);

    if (response.statusCode == 200) {
      return TrailerModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }
}
