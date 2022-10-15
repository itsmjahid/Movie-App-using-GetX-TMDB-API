import 'package:get/get.dart';
import 'package:moviezone/app/modules/moviedetails/model/movie_details_model.dart';
import 'package:moviezone/app/network/fetch_movie_details.dart';

class MoviedetailsController extends GetxController {
 var isLoading = false.obs;
  MovieDetailsModel? movieDetailsModel;
  

  
  @override
  void onInit() {
    super.onInit();
  
  }
   void movieDetails(movieID) async {
    isLoading(true);
    try {
      movieDetailsModel = (await FetchMovieDetails().fetchmovieDetails(movieID))!;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
 
}
