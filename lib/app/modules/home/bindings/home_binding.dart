import 'package:get/get.dart';
import 'package:moviezone/app/modules/home/controllers/genres_controller.dart';
import 'package:moviezone/app/modules/home/controllers/popular_movies_controller.dart';
import 'package:moviezone/app/modules/home/controllers/trending_person_controller.dart';
import 'package:moviezone/app/modules/home/model/fetch_now_playing_model.dart';
import 'package:moviezone/app/modules/moviedetails/controllers/moviedetails_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<GenresController>(
      () => GenresController(),
    );
     Get.lazyPut<PopularMoviesCrontroller>(
      () => PopularMoviesCrontroller(),
    );
     Get.lazyPut<NowPlayingMovies>(
      () => NowPlayingMovies(),
    );
     Get.lazyPut<MoviedetailsController>(
      () => MoviedetailsController(),
    );
    Get.lazyPut<TrendingPersonController>(
      () => TrendingPersonController(),
    );
  }
}
