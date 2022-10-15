import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moviezone/app/modules/home/model/fetch_now_playing_model.dart';
class FetchNowPlaying {
  Dio dio = Dio();
  static String apikey = 'c81c736cbf21e7ce9eb3628539e593c6';
  String Url =
      "https://api.themoviedb.org/3/movie/now_playing?api_key=$apikey&language=en-US&page=1";
  Future<List<NowPlayingMovies>?> fetchNowPlaying() async {
    try {
      Response response = await dio.get(Url);
      FetchNowPlayingModel fetchNowPlayingModel = FetchNowPlayingModel.fromJson(response.data);
      return fetchNowPlayingModel.results;
    } on DioError catch (exception) {
      debugPrint(exception.toString());
    }
    return null;
  }
}