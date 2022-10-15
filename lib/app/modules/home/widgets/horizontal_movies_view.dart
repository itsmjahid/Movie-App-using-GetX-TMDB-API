import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviezone/app/modules/home/controllers/movie_by_genre_controller.dart';

import 'package:moviezone/app/modules/moviedetails/controllers/moviedetails_controller.dart';
import 'package:moviezone/app/modules/moviedetails/views/moviedetails_view.dart';

// ignore: must_be_immutable
class HorizontalMovieView extends StatelessWidget {
  MovieByGenreController movieByGenreController =
      Get.put(MovieByGenreController());
  MoviedetailsController moviedetailsController =
      Get.put(MoviedetailsController());
  HorizontalMovieView({
    Key? key,
    required this.moviesIdFrom,
    required this.imageFrom,
    required this.itemCount,
  }) : super(key: key);
  final dynamic moviesIdFrom;
  final int? itemCount;
  final dynamic imageFrom;
  @override
  Widget build(BuildContext context) {
    var movieID;

    return Container(
      height: 160,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                movieID = moviesIdFrom[index].id;
                moviedetailsController.movieDetails(movieID);

                Get.to(() => MoviedetailsView());
              },
              child: Card(
                child: SizedBox(
                  height: 160.0,
                  child: AspectRatio(
                    aspectRatio: 2 / 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: imageFrom[index].posterPath == null
                          ? Image(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/no_photo.jpg"))
                          : CachedNetworkImage(
                              imageUrl: "https://image.tmdb.org/t/p/original/" +
                                  imageFrom[index].posterPath.toString()),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
