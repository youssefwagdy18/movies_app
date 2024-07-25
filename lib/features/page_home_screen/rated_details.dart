import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api_response/rated_api/RatedResponse.dart';
import 'package:movies_app/my_theme/my_theme.dart';

class RatedDetails extends StatelessWidget {
  final Result ratedFilm;
  const RatedDetails({super.key, required this.ratedFilm});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      color: const Color(0xff343534),
      // color: Colors.orange,
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width * 0.30,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              // color: Colors.orange,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    alignment: Alignment.topCenter,
                    imageUrl:
                        'https://image.tmdb.org/t/p/w500${ratedFilm.posterPath}',
                    height: MediaQuery.of(context).size.height * 0.178,
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),

                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 17,
                          color: MyTheme.selectedTabColor,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Text('${ratedFilm.voteAverage}',
                            style: MyTheme.darkMode.textTheme.titleSmall
                                ?.copyWith(fontSize: 14)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Text(
                          '${ratedFilm.title}',
                          style: MyTheme.darkMode.textTheme.titleSmall
                              ?.copyWith(fontSize: 14),
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        '${ratedFilm.releaseDate}',
                        style: MyTheme.darkMode.textTheme.titleSmall?.copyWith(
                            fontSize: 14, color: MyTheme.lightGreyColor),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
