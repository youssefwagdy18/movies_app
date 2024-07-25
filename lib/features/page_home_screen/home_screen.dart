import 'package:flutter/material.dart';
import 'package:movies_app/features/page_home_screen/home_tab_screen.dart';
import 'package:movies_app/features/page_search/search_screen.dart';
import 'package:movies_app/my_theme/my_theme.dart';
import '../page_browse/browse_screen.dart';
import '../page_watchList/watchList_screen.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex =0;
  var pageList= [const HomeTabScreen(), SearchScreen(),const BrowseScreen(),const WatchListScreen() ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pageList[selectedIndex],
        bottomNavigationBar: Theme(
          data: ThemeData(
            canvasColor: MyTheme.blackLightColor,
          ),
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            selectedItemColor: MyTheme.selectedTabColor,
            unselectedItemColor: MyTheme.lightGreyColor,
            elevation: 5,
            currentIndex: selectedIndex,
            onTap: (int index){
              selectedIndex=index;
              setState(() {
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'HOME'),
              BottomNavigationBarItem(icon: Icon(Icons.search),label: 'SEARCH'),
              BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'BROWSE'),
              BottomNavigationBarItem(icon: Icon(Icons.book),label: 'WATCHLIST'),
            ],
          ),
        )
    );
  }
}
