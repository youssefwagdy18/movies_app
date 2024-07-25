import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api_response/browse_page_api/FilmsGenresResponse.dart';
import 'package:movies_app/features/page_browse/film_of_category_details.dart';
import 'package:movies_app/my_theme/my_theme.dart';

class FilmsOfCategory extends StatefulWidget {
  final List<Results> selectedFilm;
  final int index;
  const FilmsOfCategory(
      {super.key, required this.selectedFilm, required this.index});

  @override
  State<FilmsOfCategory> createState() => _FilmsOfCategoryState();
}

class _FilmsOfCategoryState extends State<FilmsOfCategory> {
  @override
  Widget build(BuildContext context) {
    var poster =
        "https://image.tmdb.org/t/p/original${widget.selectedFilm[widget.index].posterPath}";
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: MyTheme.primaryGreyColor),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.35,
      // width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 9,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: CachedNetworkImage(imageUrl: poster)),
          ),
          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Movie Name :',
                            style: MyTheme.darkMode.textTheme.titleMedium!
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            widget.selectedFilm[widget.index].title ?? '',
                            style: MyTheme.darkMode.textTheme.titleMedium!
                                .copyWith(fontWeight: FontWeight.w400),
                            maxLines: 2,
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: SingleChildScrollView(
                            child: Text(
                              '  ${widget.selectedFilm[widget.index].overview ?? ''}',
                              style: MyTheme.darkMode.textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.w300),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    //   Column(
    //   children: [
    //     Text(selectedFilm[index].title??'',
    //     style: Theme.of(context).textTheme.titleMedium),
    //     SizedBox(height: 10,),
    //     Text(selectedFilm[index].overview??'',
    //     style: Theme.of(context).textTheme.titleMedium)
    //   ],
    // );
  }
}
