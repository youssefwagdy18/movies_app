import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api_response/browse_page_api/GenreIdResponse.dart';
import 'package:movies_app/config/browse_provider.dart';
import 'package:movies_app/features/page_browse/filmsListById.dart';
import 'package:provider/provider.dart';


class BrowseCategoryItem extends StatefulWidget {
  final Genres genres;
  final int index;
  final int? id;
  const BrowseCategoryItem({super.key, required this.genres, required this.index ,required this.id});

  @override
  State<BrowseCategoryItem> createState() => _BrowseCategoryItemState();
}

class _BrowseCategoryItemState extends State<BrowseCategoryItem> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BrowseProvider>(context);
    return InkWell(
      onTap: (){
        provider.addingGenreId(widget.genres);
        // print(provider.genreId);
        Navigator.push(context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) =>  const FilmsListByI()
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: CachedNetworkImage(
                  imageUrl:
                      'https://img.freepik.com/free-photo/movie-lettering-yellow-background-with-copy-space_23-2148425107.jpg?t=st=1720447421~exp=1720448021~hmac=f8c8ef10a67430e3054e6e38aff845fbf1edec9a099f7490f3029000341fe039'),
            ),
            Text(
              widget.genres.name ?? '',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
