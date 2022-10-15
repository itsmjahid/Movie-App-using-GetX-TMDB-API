import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moviezone/app/modules/home/model/trending_person_model.dart';


class FetchTrendingPerson {
  Dio dio = Dio();
  static String apikey = 'c81c736cbf21e7ce9eb3628539e593c6';
  String Url =
     'https://api.themoviedb.org/3/trending/person/week?api_key=$apikey';
  Future<List<TrendingPerson>?> fetchTrendingPerson() async {
    try {
      Response response = await dio.get(Url);
      TrendingPersonModel trendingPersonModel = TrendingPersonModel.fromJson(response.data);
      return trendingPersonModel.results;
    } on DioError catch (exception) {
      debugPrint(exception.toString());
    }
    return null;
  }
}