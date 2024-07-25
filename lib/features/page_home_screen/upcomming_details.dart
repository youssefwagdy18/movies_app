import 'package:flutter/material.dart';
import 'package:movies_app/Favourites.dart';
import 'package:movies_app/config/watchList_provider.dart';
import 'package:movies_app/my_theme/my_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

import '../../api_response/upcomming_api/UpcommingResponse.dart';
import '../../fireBaseUtils.dart';


final pageBucket = PageStorageBucket();

class UpcommingDetails extends StatefulWidget {
  static String routeName = 'upcomming_datails';
  final int index;
  final Result filmPath;
  const UpcommingDetails(
      {super.key, required this.filmPath, required this.index});

  @override
  State<UpcommingDetails> createState() => _UpcommingDetailsState();
}

class _UpcommingDetailsState extends State<UpcommingDetails>
    with AutomaticKeepAliveClientMixin {
  bool isSelected = false;
  Favourites favSelected = Favourites();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var provider = Provider.of<WatchlistProvider>(context);
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      color: const Color(0xff343534),
      height: MediaQuery.of(context).size.height * 0.30,
      width: MediaQuery.of(context).size.width * 0.30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            // textDirection: TextDirection.rtl,
            alignment: Alignment.topLeft,
            children: [
              CachedNetworkImage(
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500${widget.filmPath.posterPath}'),
              IconButton(
                alignment: Alignment.topLeft,
                onPressed: () {
                  var favResult = widget.filmPath;
                  if (provider.selectedIndex.contains(widget.index)) {
                    confirmAddFav(favResult, isSelected);
                    provider.removingIndex(widget.index);
                    provider.sortingIndex();
                    provider.selectedList[widget.index]=true;
                    provider.getAllFilmsFromFireStore();
                  } else if (!provider.selectedIndex.contains(widget.index)) {
                    deleteFav(favResult, isSelected);
                    provider.addingIndex(widget.index);
                    provider.sortingIndex();
                    provider.selectedList[widget.index]=false;
                    provider.getAllFilmsFromFireStore();
                  }
                  setState(
                    () {},
                  );
                },
                icon:provider.selectedList[widget.index]==false
                    ? const Icon(
                        color: MyTheme.lightGreyColor,
                        Icons.favorite,
                        size: 35,
                      )
                    : const Icon(
                        color: Colors.yellow,
                        Icons.favorite,
                        size: 35,
                      ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.filmPath.title ?? '',
                style: MyTheme.darkMode.textTheme.titleSmall
                    ?.copyWith(fontSize: 14),
              ),
            ),
          )
        ],
      ),
    );
  }

  confirmAddFav(Result favResult, bool isSelected) {
    Favourites favFilm = Favourites(
      backdropPath: favResult.backdropPath,
        genreIds: favResult.genreIds,
        overview: favResult.overview,
        popularity: favResult.popularity,
        voteAverage: favResult.voteAverage,
        favIndex: widget.index,
        favDate: favResult.releaseDate,
        favId: "${favResult.id}",
        favTitle: favResult.title,
        favPoster: "https://image.tmdb.org/t/p/w500${favResult.posterPath}",
        isSelectedFilm: isSelected);
    FireBaseUtils.addFilmToFireBase(favFilm).timeout(const Duration(milliseconds: 30),
        onTimeout: () {
      // showDialog(
      //   context: context,
      //   builder: (alertContext) {
      //     return AlertDialog(
      //       backgroundColor: Colors.black,
      //       content:  Text('Favourite film has been added\n to Watchlist',
      //           style: MyTheme.darkMode.textTheme.titleMedium!.copyWith(
      //             fontWeight: FontWeight.w400
      //           )),
      //       actions: [
      //         ElevatedButton(
      //           onPressed: () {
      //             Navigator.pop(alertContext);
      //           },
      //           style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
      //           child: const Text(
      //             'Ok',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //         )
      //       ],
      //     );
      //   },
      // );
    });
  }

  deleteFav(Result favResult, bool isSelected) {
    Favourites favFilm = Favourites(
        favIndex: widget.index,
        favTitle: favResult.title,
        favPoster: "https://image.tmdb.org/t/p/w500${favResult.posterPath}",
        favDate: favResult.releaseDate,
        favId: "${favResult.id}",
        isSelectedFilm: isSelected);
    FireBaseUtils.deleteFilmFromFireBase(favFilm)
        .timeout(const Duration(milliseconds: 30), onTimeout: () {
      // showDialog(
      //   context: context,
      //   builder: (alertContext) {
      //     return AlertDialog(
      //       backgroundColor: Colors.black,
      //       content:  Text('Favourite film has been deleted\n from Watchlist',
      //           style: MyTheme.darkMode.textTheme.titleMedium!.copyWith(
      //         fontWeight: FontWeight.w400)),
      //       actions: [
      //         ElevatedButton(
      //           onPressed: () {
      //             Navigator.pop(alertContext);
      //           },
      //           style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
      //           child: const Text(
      //             'Ok',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //         )
      //       ],
      //     );
      //   },
      // );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
