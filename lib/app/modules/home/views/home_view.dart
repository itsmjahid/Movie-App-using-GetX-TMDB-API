import 'package:flutter/material.dart';
import 'package:moviezone/app/modules/home/controllers/genres_controller.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

import 'package:moviezone/app/modules/home/controllers/movie_by_genre_controller.dart';
import 'package:moviezone/app/modules/home/controllers/popular_movies_controller.dart';
import 'package:moviezone/app/modules/home/controllers/trending_person_controller.dart';

import 'package:moviezone/app/modules/home/widgets/genre_view.dart';
import 'package:moviezone/app/modules/home/widgets/nowplaying_slider.dart';
import 'package:moviezone/app/modules/home/widgets/horizontal_movies_view.dart';

import 'package:moviezone/app/modules/home/widgets/section_divider_title.dart';
import 'package:moviezone/app/modules/home/widgets/person_view.dart';

import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
 
  PopularMoviesCrontroller popularMoviesCrontroller =
      Get.put(PopularMoviesCrontroller());
  GenresController genresController = Get.put(GenresController());
  MovieByGenreController movieByGenreController =
      Get.put(MovieByGenreController());

  TrendingPersonController trendingPersonController =
      Get.put(TrendingPersonController());

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
        return Center(
            child: Platform.isAndroid
                ? CupertinoActivityIndicator()
                : CupertinoActivityIndicator());
      }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NowPlayingSlider(),
                GenreView(
                    genresController: genresController,
                    movieByGenreController: movieByGenreController),
                SectionDividerTitle(
                  text: "Trending Persons",
                ),
                PersonView(
              
                 itemCount: trendingPersonController.trendingPersonList.length,
                 imageFrom: trendingPersonController.trendingPersonList,
                 nameFrom: trendingPersonController.trendingPersonList,
              
                ),
                SectionDividerTitle(
                  text: "Popular Movies",
                ),
                HorizontalMovieView(
                  moviesIdFrom: popularMoviesCrontroller.popularMovileList,
                  imageFrom: popularMoviesCrontroller.popularMovileList,
                  itemCount: popularMoviesCrontroller.popularMovileList.length,
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}







// Card(
//                         child: Column(
//                           //crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           height: 170,
//                           width: 200,
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   fit: BoxFit.cover,
//                                   image: NetworkImage(
//                                       "https://image.tmdb.org/t/p/original/" +
//                                           movieByGenreController
//                                               .movieByGenreList[index]
//                                               .posterPath))),
//                         ),
//                         Row(
//                           children: [
//                             Text(movieByGenreController
//                                 .movieByGenreList[index].voteAverage
//                                 .toString()),
//                             RatingBar.builder(
//                               ignoreGestures: true,
//                               //unratedColor: Colors.black,
//                               initialRating: movieByGenreController
//                                   .movieByGenreList[index].voteAverage
//                                   .toDouble(),
//                               minRating: 1,
//                               itemSize: 15,
//                               maxRating: 10,
//                               direction: Axis.horizontal,
//                               allowHalfRating: true,
//                               itemPadding: EdgeInsets.symmetric(horizontal: 1),
//                               itemCount: 10,
//                               //itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//                               itemBuilder: (context, _) => Icon(
//                                 Icons.star,
//                                 color: Colors.amber,
//                               ),
//                               onRatingUpdate: (rating) {
//                                 print(rating);
//                               },
//                               updateOnDrag: false,
//                             ),
//                           ],
//                         ),
//                         Text(movieByGenreController
//                             .movieByGenreList[index].title
//                             .toString()),
                            
//                       ],
//                     ));