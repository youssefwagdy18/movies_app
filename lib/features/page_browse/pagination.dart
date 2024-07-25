// import 'package:flutter/material.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// import 'package:movies_app/api_response/browse_page_api/FilmsGenresResponse.dart';
// import 'package:movies_app/api_response/browse_page_api/filmsGenresApiManager.dart';
// import 'package:movies_app/config/browse_provider.dart';
// import 'package:provider/provider.dart';
//
// class Film extends StatefulWidget {
//
//   static const String routeName = 'film_list_by_id';
//
//   @override
//   State<Film> createState() => _FilmsListByIdState();
// }
//
// class _FilmsListByIdState extends State<Film> {
//   BrowseProvider provider =BrowseProvider();
//   PagingController<int, Results> pagingController =
//       PagingController(firstPageKey: 1);
//
//
//   @override
//   void initState() {
//     pagingController.addPageRequestListener((pageKey) {
//       fetchPage(pageKey);
//     });
//     super.initState();
//   }
//
//    Future<FilmsGenresResponse?> fetchPage(int pageKey) async {
//     try {
//       final pageItems = await FilmsGenresApiManager.getData(pageKey,);
//       var filmsList = pageItems?.results;
//       final isLastPage = filmsList!.length < 20;
//       if (isLastPage) {
//         pagingController.appendLastPage(filmsList);
//       } else {
//         final nextPage = pageKey + filmsList.length;
//         pagingController.appendPage(filmsList, nextPage);
//       }
//       List outputList = filmsList.where((o) => o.genreIds!.contains(provider.genreId)).toList();
//     } catch (e) {
//       print(e) ;
//     }
//     return null;
//   }
//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<BrowseProvider>(context);
//     List<int> indexes=[];
//     return CustomScrollView(
//         scrollDirection: Axis.vertical,
//           slivers: <Widget>[
//             PagedSliverList<int, Results>(
//               pagingController: pagingController,
//               builderDelegate: PagedChildBuilderDelegate<Results>(
//                 itemBuilder: (context, item, index) {
//                   if(!indexes.contains(index)){
//                     indexes.add(index);
//                     provider.index=indexes;
//                     // print(provider.unSortedFilms);
//                     print(provider.genreId);
//                   }
//                   return Text(
//                     item.title ?? '',
//                     style: Theme.of(context).textTheme.titleLarge,
//                   );
//                 }
//               ),
//             ),
//           ],
//     );
//
//
//
//
//       PagedListView<int, Results>(
//         pagingController: pagingController,
//         builderDelegate: PagedChildBuilderDelegate<Results>(
//             itemBuilder: (context, item, index) {
//           return Text(
//             item.title ?? '',
//             style: Theme.of(context).textTheme.titleLarge,
//           );
//         }),
//     );
//     }
//
//   @override
//   void dispose() {
//     pagingController.dispose();
//     super.dispose();
//   }
// }