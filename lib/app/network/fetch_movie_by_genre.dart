import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:moviezone/app/modules/home/model/movie_by_genre_model.dart';
class FetchMovieByGenre {
 
  Future<List<MovieByGenreResult>?> fetchmovieByGenre(genreId) async {
     Dio dio = Dio();
  final  String apikey = 'c81c736cbf21e7ce9eb3628539e593c6';
  String Url =
      "https://api.themoviedb.org/3/discover/movie?with_genres=$genreId&api_key=$apikey";
    try {
      Response response = await dio.get(Url);
      MovieByGenre movieByGenre = MovieByGenre.fromJson(response.data);
      return movieByGenre.results;
    } on DioError catch (exception) {
      debugPrint(exception.toString());
    }
    return null;
  }
}