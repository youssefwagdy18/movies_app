import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/film_details_on_tap.dart';
import '../../api_response/top_section_api/TopSectionResponse.dart';
import '../../api_response/top_section_api/topSectionApiManager.dart';
import '../../my_theme/my_theme.dart';
import 'popular_details.dart';

class PopularSection extends StatefulWidget {

  const PopularSection({super.key});

  @override
  State<PopularSection> createState() => _PopularSectionState();
}

class _PopularSectionState extends State<PopularSection> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TopSectionResponse?>(
      future: TopSectionApiManager.getData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                Text('Something went wrong!',
                    style: MyTheme.darkMode.textTheme.titleMedium),
                ElevatedButton(
                    onPressed: () {
                      TopSectionApiManager.getData();
                      setState(() {});
                    },
                    child: const Text('try again'))
              ],
            ),
          );
        } else if (snapshot.hasData) {
          var filmList = snapshot.data?.results ?? [];
          return CarouselSlider.builder(
            itemCount: filmList.length,
            itemBuilder: (context, itemIndex, pageViewIndex) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FilmDetailsOnTap(
                        title: filmList[itemIndex].title ?? '',
                        backdropPath: filmList[itemIndex].backdropPath ?? '',
                        list: filmList,
                        genres: filmList[itemIndex].genreIds ?? [],
                        overview: filmList[itemIndex].overview ?? '',
                        popularity: filmList[itemIndex].popularity ?? 0,
                        voteAverage: filmList[itemIndex].voteAverage ?? 0,
                        posterPath: filmList[itemIndex].posterPath ?? '',
                        releaseDate: filmList[itemIndex].releaseDate ?? '',
                        index: itemIndex,
                      ),
                    ),
                  );
                },
                child: TopSectionDetails(
                  videoPath: filmList[itemIndex],
                ),
              );
            },
            options: CarouselOptions(
              viewportFraction: 1,
              height: MediaQuery.of(context).size.height * 0.40,
              scrollDirection: Axis.horizontal,
              initialPage: 1,
              autoPlay: false,
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
