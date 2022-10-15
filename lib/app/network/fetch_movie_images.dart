import 'package:dio/dio.dart';

import 'package:moviezone/app/modules/moviedetails/model/movie_images_model.dart';

class FetchMovieImages {
  Dio dio = Dio();
  Future<MovieImagesModel> fetchMovieImages(movieID) async {
    final String apiKey = 'c81c736cbf21e7ce9eb3628539e593c6';
    final String url =
        'https://api.themoviedb.org/3/movie/$movieID/images?api_key=$apiKey';
    try {
      final response = await dio.get(url);
      return MovieImagesModel.fromJson(response.data);
    } catch (error, stacktrace) {
      throw Exception('Exception: $error with stacktrace: $stacktrace');
    }
  }
}
