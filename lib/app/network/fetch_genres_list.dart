import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moviezone/app/modules/home/model/genres_model.dart';

class FetchGenres {
  Dio dio = Dio();
  static String apikey = 'c81c736cbf21e7ce9eb3628539e593c6';
  String Url =
      "https://api.themoviedb.org/3/genre/movie/list?api_key=$apikey&language=en-US";
  Future<List<Genres>?> fetchGenres() async {
    try {
      Response response = await dio.get(Url);
      GenresModel genresModel = GenresModel.fromJson(response.data);
      return genresModel.genres;
    } on DioError catch (exception) {
      debugPrint(exception.toString());
    }
    return null;
  }
}