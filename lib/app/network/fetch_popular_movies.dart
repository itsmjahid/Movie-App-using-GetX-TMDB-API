import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:moviezone/app/modules/home/model/popular_movies_model.dart';
class FetchPopularMovies {
  Dio dio = Dio();
  static String apikey = 'c81c736cbf21e7ce9eb3628539e593c6';
  String Url =
      "https://api.themoviedb.org/3/movie/popular?api_key=$apikey&language=en-US&page=1";
  Future<List<PopularMovies>?> fetchPopularMovies() async {
    try {
      Response response = await dio.get(Url);
      PopularMoviesModel popularMoviesModel = PopularMoviesModel.fromJson(response.data);
      return popularMoviesModel.results;
    } on DioError catch (exception) {
      debugPrint(exception.toString());
    }
    return null;
  }
}