import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moviezone/app/modules/home/model/similar_movies_model.dart';


class FetchSimilarMovies {
 
  Future<List<SimilarMovies>?> fetchsimilarMovies(int movieID) async {
     Dio dio = Dio();
  final  String apikey = 'c81c736cbf21e7ce9eb3628539e593c6';
  String Url =
      "https://api.themoviedb.org/3/movie/$movieID/similar?api_key=$apikey";
    try {
      Response response = await dio.get(Url);
      SimilarMoviesModel similarMoviesModel  = SimilarMoviesModel.fromJson(response.data);
      return similarMoviesModel.results;
    } on DioError catch (exception) {
      debugPrint(exception.toString());
    }
    return null;
  }
}