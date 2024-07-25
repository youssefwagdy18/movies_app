import 'package:flutter/material.dart';
import 'package:movies_app/api_response/upcomming_api/upcommingApiManager.dart';
import 'package:movies_app/config/watchList_provider.dart';
import 'package:movies_app/features/page_home_screen/upcomming_details.dart';
import 'package:provider/provider.dart';
import '../../api_response/upcomming_api/UpcommingResponse.dart';
import '../../my_theme/my_theme.dart';
import '../film_details_on_tap.dart';

final pageBucket = PageStorageBucket();

class UpcommingSection extends StatefulWidget {
  const UpcommingSection({super.key});

  @override
  State<UpcommingSection> createState() => _UpcommingSectionState();
}

class _UpcommingSectionState extends State<UpcommingSection> {
  late WatchlistProvider provider;
  late Result favResult;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<WatchlistProvider>(context);
    return FutureBuilder<UpcommingResponse?>(
      future: UpcommingApiManager.getData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                Text(
                  'Something Went Wrong',
                  style: MyTheme.darkMode.textTheme.titleMedium,
                ),
                ElevatedButton(
                    onPressed: () {
                      UpcommingApiManager.getData();
                      setState(() {});
                    },
                    child: const Text('Try Again'))
              ],
            ),
          );
        }
        if (snapshot.hasData) {
          var upcomingFilms = snapshot.data?.results ?? [];
          if (provider.selectedIndex.isEmpty) {
            for (int i = 0; i < upcomingFilms.length; i++) {
              upcomingFilms[i];
              provider.selectedIndex.add(i);
              provider.selectedList.add(false);
            }
            provider.getAllFilmsFromFireStore();
          }
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
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
                      'New Releases',
                      style: MyTheme.darkMode.textTheme.titleMedium,
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  child: PageStorage(
                    bucket: pageBucket,
                    child: ListView.builder(
                        key: const PageStorageKey<String>('pageOne'),
                        scrollDirection: Axis.horizontal,
                        itemCount: upcomingFilms.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FilmDetailsOnTap(
                                              title: upcomingFilms[index].title ??
                                                  '',
                                              backdropPath: upcomingFilms[index]
                                                      .backdropPath ??
                                                  '',
                                              list: upcomingFilms,
                                              genres:
                                                  upcomingFilms[index].genreIds ??
                                                      [],
                                              overview:
                                                  upcomingFilms[index].overview ??
                                                      '',
                                              popularity: upcomingFilms[index]
                                                      .popularity ??
                                                  0,
                                              voteAverage: upcomingFilms[index]
                                                      .voteAverage ??
                                                  0,
                                              posterPath: upcomingFilms[index]
                                                      .posterPath ??
                                                  '',
                                              releaseDate: upcomingFilms[index]
                                                      .releaseDate ??
                                                  '',
                                              index: index)));
                                },
                                child: UpcommingDetails(
                                  filmPath: upcomingFilms[index],
                                  index: index,
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
