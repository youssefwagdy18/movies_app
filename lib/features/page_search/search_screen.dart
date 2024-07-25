import 'package:flutter/material.dart';
import 'package:movies_app/features/page_search/search_item.dart';
import 'package:movies_app/features/page_search/searched_movie.dart';
import 'package:movies_app/my_theme/my_theme.dart';

import '../../api_response/search_page_api/SearchResponse.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'SearchScreen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.015,
          ),
          GestureDetector(
            onTap: (){
              showSearch(
                context: context,
                delegate: SearchMovie(),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(width: 2,color: Colors.white),
                color: const Color(0xff7e7e7e),
                borderRadius: BorderRadius.circular(30)
              ),
              margin: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height*0.07,
              width: double.infinity,
              child: Row(
                children: [
                  const Icon(Icons.search,color: MyTheme.primaryGreyColor,),
                  SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                  Text('Enter your search here',style: MyTheme.darkMode.textTheme.titleMedium!
                      .copyWith(color: MyTheme.blackLightColor),)
                ],
              ),
            ),
          )
        ],
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Search Example'),
    //   ),
    //   body: Column(
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.all(16.0),
    //         child: TextField(
    //           controller: controller,
    //           decoration: InputDecoration(
    //             labelText: 'Search',
    //             border: OutlineInputBorder(),
    //           ),
    //         ),
    //       ),
    //       Expanded(
    //         child: ListView.builder(
    //           itemCount: filteredList.length,
    //           itemBuilder: (context, index) {
    //             return ListTile(
    //               title: Text(filteredList[index].title??''),
    //             );
    //           },
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}


