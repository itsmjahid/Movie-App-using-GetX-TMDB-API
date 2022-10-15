import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviezone/app/modules/moviedetails/controllers/moviedetails_controller.dart';
import 'package:moviezone/app/modules/moviedetails/model/movie_images_model.dart';

class OverviewDetails extends StatelessWidget {
  const OverviewDetails({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final MoviedetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(controller.movieDetailsModel!.overview!,
            style: const TextStyle(
                height: 1.5, fontSize: 12.0, fontWeight: FontWeight.w600)),
        Container(
          height: 110,
          child: ListView.separated(
            separatorBuilder: (context, index) => VerticalDivider(
              color: Colors.transparent,
              width: 1,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: controller
                .movieDetailsModel!.movieImagesModel!.backdrops!.length,
            itemBuilder: (context, index) {
              Backdrops image = controller
                  .movieDetailsModel!.movieImagesModel!.backdrops![index];
              return Container(
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (Context) {
                          return AlertDialog(
                            contentPadding: EdgeInsets.all(0),
                            content: Container(
                              height: MediaQuery.of(context).size.height / 2.5,
                              width: MediaQuery.of(context).size.width,
                              child: Image(
                                  fit: BoxFit.fill,
                                  width: MediaQuery.of(context).size.width,
                                  image: CachedNetworkImageProvider(
                                      'https://image.tmdb.org/t/p/w500${image.filePath}')),
                            ),
                          );
                        });
                  },
                  child: Card(
                    elevation: 3,
                    borderOnForeground: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: AspectRatio(
                      aspectRatio: 3 / 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          placeholder: (context, url) => Center(
                            child: CupertinoActivityIndicator(),
                          ),
                          imageUrl:
                              'https://image.tmdb.org/t/p/w500${image.filePath}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
