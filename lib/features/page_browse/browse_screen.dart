import 'package:flutter/material.dart';
import 'package:movies_app/api_response/browse_page_api/GenreIdResponse.dart';
import 'package:movies_app/api_response/browse_page_api/genreApiManager.dart';
import 'package:movies_app/features/page_browse/browse_category_item.dart';


class BrowseScreen extends StatefulWidget {
  static const String routeName = 'browseScreen';

  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GenreIdResponse?>(
        future: GenreApiManager.getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text('${snapshot.error}'),
                ElevatedButton(
                    onPressed: () {
                      GenreApiManager.getData();
                    },
                    child: const Text('Try again'))
              ],
            );
          }
          var browseList = snapshot.data!.genres ?? [];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 25, top: 25),
                child: Text(
                  'Browse Category',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white),
                ),
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1),
                    itemCount: browseList.length,
                    itemBuilder: (context, index) {
                      // print(browseList[index].id);
                      return BrowseCategoryItem(
                          genres: browseList[index], index: index,id: browseList[index].id,);
                    }),
              ),
            ],
          );
        });
  }
}
// onTap: () {
//   // Navigator.pushNamed(context, FilmsListById.routeName,
//   //     arguments: browseList[index]);
//
// },
