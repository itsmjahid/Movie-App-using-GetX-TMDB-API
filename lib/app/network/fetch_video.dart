import 'package:dio/dio.dart';



class FetchMovieVideos {
  Dio dio = Dio();
  Future<String> fetchMovieVideos(movieID) async {
    final String apiKey = 'c81c736cbf21e7ce9eb3628539e593c6';
    final String url =
        'https://api.themoviedb.org/3/movie/$movieID/videos?api_key=$apiKey';
      try {
      final response = await dio.get(url);
      var youtubeId = response.data['results'][0]['key'];
      return youtubeId;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception: $error with stacktrace: $stacktrace');
    }
  }
}
