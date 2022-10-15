import 'package:get/get.dart';
import 'package:moviezone/app/modules/home/controllers/trending_person_controller.dart';

import '../controllers/moviedetails_controller.dart';

class MoviedetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoviedetailsController>(
      () => MoviedetailsController(),
    );
    Get.lazyPut<TrendingPersonController>(
      () => TrendingPersonController(),
    );
  }
}
