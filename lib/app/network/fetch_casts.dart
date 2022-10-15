
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:moviezone/app/modules/moviedetails/model/casts_model.dart';
class FetchCasts {
  Dio dio = Dio();

  Future<List<Cast>?> getCreditsData(int movieID) async {
     final String apikey = 'c81c736cbf21e7ce9eb3628539e593c6';
    String url = 'https://api.themoviedb.org/3/movie/$movieID/credits?api_key=$apikey';
    try {
      Response response = await dio.get(url);
      CreditModelData creditModelData = CreditModelData.fromJson(response.data);
      return creditModelData.cast;
    } on DioError catch (exception) {
      debugPrint(exception.toString());
    }
    return null;
  }
}