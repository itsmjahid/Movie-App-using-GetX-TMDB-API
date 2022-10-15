import 'package:flutter/material.dart';

import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

import 'package:moviezone/app/modules/home/widgets/horizontal_movies_view.dart';

import 'package:moviezone/app/modules/home/widgets/person_view.dart';
import 'package:moviezone/app/modules/home/widgets/section_divider_title.dart';

import 'package:moviezone/app/modules/moviedetails/widgets/about_movie.dart';
import 'package:moviezone/app/modules/moviedetails/widgets/overview_details.dart';
import 'package:moviezone/app/modules/moviedetails/widgets/poster_details.dart';
import 'package:moviezone/app/modules/moviedetails/widgets/times_and_catagory_details.dart';

import '../controllers/moviedetails_controller.dart';

// ignore: must_be_immutable
class MoviedetailsView extends GetView<MoviedetailsController> {
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
            child: Platform.isAndroid
                ? CupertinoActivityIndicator()
                : CupertinoActivityIndicator());
      }
      return Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PosterDetails(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    TimesAndCatagory(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SectionDividerTitle(
                      text: "OVERVIEW",
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    OverviewDetails(controller: controller),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SectionDividerTitle(
                      text: "about movie",
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    AboutMovie(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SectionDividerTitle(
                      text: "CASTS",
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    PersonView(
                      itemCount: controller.movieDetailsModel!.castList!.length,
                      imageFrom: controller.movieDetailsModel!.castList!,
                      nameFrom: controller.movieDetailsModel!.castList!,
                    ),
                    SectionDividerTitle(
                      text: "similar movies",
                    ),
                    HorizontalMovieView(
                        moviesIdFrom:
                            controller.movieDetailsModel!.similarMovies,
                        imageFrom: controller.movieDetailsModel!.similarMovies,
                        itemCount:
                            controller.movieDetailsModel!.similarMovies!.length)
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
    });
  }
}
