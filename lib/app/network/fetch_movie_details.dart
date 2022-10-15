import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:moviezone/app/modules/moviedetails/model/movie_details_model.dart';
import 'package:moviezone/app/network/fetch_casts.dart';
import 'package:moviezone/app/network/fetch_movie_images.dart';
import 'package:moviezone/app/network/fetch_similar_movies.dart';
import 'package:moviezone/app/network/fetch_video.dart';

class FetchMovieDetails {
  Future<MovieDetailsModel?> fetchmovieDetails(movieID) async {
    Dio dio = Dio();
    final String apikey = 'c81c736cbf21e7ce9eb3628539e593c6';
    String Url =
        "https://api.themoviedb.org/3/movie/$movieID?api_key=$apikey&language=en-US";
    try {
      Response response = await dio.get(Url);
      MovieDetailsModel movieDetailsModel =
          MovieDetailsModel.fromJson(response.data);
    movieDetailsModel.trailerId  = await FetchMovieVideos().fetchMovieVideos(movieID);
      movieDetailsModel.castList = await FetchCasts().getCreditsData(movieID);
      movieDetailsModel.similarMovies = await FetchSimilarMovies().fetchsimilarMovies(movieID);

      movieDetailsModel.movieImagesModel =
          await FetchMovieImages().fetchMovieImages(movieID);
      return movieDetailsModel;
    } on DioError catch (exception) {
      debugPrint(exception.toString());
    }
    return null;
  }
}
