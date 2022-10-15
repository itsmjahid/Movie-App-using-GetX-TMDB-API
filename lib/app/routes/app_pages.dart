import 'package:get/get.dart';

import 'package:moviezone/app/modules/home/bindings/home_binding.dart';
import 'package:moviezone/app/modules/home/views/home_view.dart';
import 'package:moviezone/app/modules/moviedetails/bindings/moviedetails_binding.dart';
import 'package:moviezone/app/modules/moviedetails/views/moviedetails_view.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MOVIEDETAILS,
      page: () => MoviedetailsView(),
      binding: MoviedetailsBinding(),
    ),
  ];
}
