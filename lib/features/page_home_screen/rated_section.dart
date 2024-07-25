import 'package:flutter/material.dart';
import 'package:movies_app/features/film_details_on_tap.dart';
import 'package:movies_app/features/page_home_screen/rated_details.dart';
import 'package:movies_app/features/page_home_screen/upcomming_details.dart';
import 'package:movies_app/my_theme/my_theme.dart';

import '../../api_response/rated_api/RatedResponse.dart';
import '../../api_response/rated_api/ratedApiManager.dart';

class RatedSection extends StatefulWidget {
  const RatedSection({super.key});

  @override
  State<RatedSection> createState() => _RatedSectionState();
}

class _RatedSectionState extends State<RatedSection> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RatedResponse?>(
      future: RatedApiManager.getData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Column(
            children: [
              Text(
                'Something went wrong',
                style: MyTheme.darkMode.textTheme.titleMedium,
              ),
              ElevatedButton(
                  onPressed: () {
                    RatedApiManager.getData();
                    setState(() {});
                  },
                  child: const Text('Try Again'))
            ],
          );
        } else if (snapshot.hasData) {
          var topRatedFilms = snapshot.data?.results ?? [];
          return Container(
            height: MediaQuery.of(context).size.height * 0.40,
            margin: const EdgeInsets.symmetric(vertical: 5),
            color: MyTheme.primaryGreyColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Recommended',
                      style: MyTheme.darkMode.textTheme.titleMedium,
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  child: PageStorage(
                    bucket: pageBucket,
                    child: ListView.builder(
                      key: const PageStorageKey<String>('pageOne'),
                      itemBuilder: (context, int index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FilmDetailsOnTap(
                                          title:
                                              topRatedFilms[index].title ?? '',
                                          backdropPath: topRatedFilms[index]
                                                  .backdropPath ??
                                              '',
                                          list: topRatedFilms,
                                          genres:
                                              topRatedFilms[index].genreIds ??
                                                  [],
                                          overview:
                                              topRatedFilms[index].overview ??
                                                  '',
                                          popularity:
                                              topRatedFilms[index].popularity ??
                                                  0,
                                          voteAverage: topRatedFilms[index]
                                                  .voteAverage ??
                                              0,
                                          posterPath:
                                              topRatedFilms[index].posterPath ??
                                                  '',
                                          releaseDate: topRatedFilms[index]
                                                  .releaseDate ??
                                              '',
                                          index: index)));
                            },
                            child:
                                RatedDetails(ratedFilm: topRatedFilms[index]));
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: topRatedFilms.length,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
