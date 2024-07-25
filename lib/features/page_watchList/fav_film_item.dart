import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/config/watchList_provider.dart';
import 'package:movies_app/Favourites.dart';
import 'package:movies_app/my_theme/my_theme.dart';
import 'package:provider/provider.dart';

class FavFilmItem extends StatefulWidget {
  final Favourites favFilmItem;
  const FavFilmItem({super.key, required this.favFilmItem});

  @override
  State<FavFilmItem> createState() => _FavFilmItemState();
}

class _FavFilmItemState extends State<FavFilmItem> {
  @override
  Widget build(BuildContext context) {
    WatchlistProvider provider = Provider.of(context);
    if(provider.filmList.isEmpty){
      provider.getAllFilmsFromFireStore();
    }
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: MyTheme.primaryGreyColor),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: CachedNetworkImage(
                    imageUrl: widget.favFilmItem.favPoster ?? '')),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Movie Name :',
                          style: MyTheme.darkMode.textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 70,
                          child: Text(
                            widget.favFilmItem.favTitle ?? '',
                            style: MyTheme.darkMode.textTheme.titleMedium!
                                .copyWith(fontWeight: FontWeight.w400),
                            maxLines: 3,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    'Release Date :  ${widget.favFilmItem.favDate ?? ''}',
                    style: MyTheme.darkMode.textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
