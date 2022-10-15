import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:moviezone/app/modules/home/controllers/genres_controller.dart';
import 'package:moviezone/app/modules/home/controllers/movie_by_genre_controller.dart';
import 'package:moviezone/app/modules/home/widgets/horizontal_movies_view.dart';
import 'package:moviezone/app/modules/home/widgets/section_divider_title.dart';
import 'package:moviezone/app/modules/moviedetails/controllers/moviedetails_controller.dart';

// ignore: must_be_immutable
class GenreView extends StatelessWidget {
  MoviedetailsController moviedetailsController =
      Get.put(MoviedetailsController());

  GenreView({
    Key? key,
    required this.genresController,
    required this.movieByGenreController,
  }) : super(key: key);

  final GenresController genresController;
  final MovieByGenreController movieByGenreController;

  @override
  Widget build(BuildContext context) {
    int genreId = 28;
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionDividerTitle(
            text: "Genres",
          ),
          Container(
            height: 40,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: genresController.genresList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      genreId = genresController.genresList[index].id;
                      movieByGenreController.movieByGenre(genreId);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color:
                              (genresController.genresList[index].id == genreId)
                                  ? Colors.white
                                  : Colors.red,
                        ),
                        height: 50.0,
                        width: 100.0,
                        child: Center(
                            child: Text(
                          genresController.genresList[index].name.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                            color: (genresController.genresList[index].id ==
                                    genreId)
                                ? Colors.red
                                : Colors.white,
                          ),
                        )),
                      ),
                    ),
                  );
                }),
          ),
          SectionDividerTitle(
            text: "Filtered By Genres",
          ),
          HorizontalMovieView(
            moviesIdFrom: movieByGenreController.movieByGenreList,
            imageFrom: movieByGenreController.movieByGenreList,
            itemCount: movieByGenreController.movieByGenreList.length,
          )
        ],
      );
    });
  }
}
