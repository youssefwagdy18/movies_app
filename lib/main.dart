import 'package:flutter/material.dart';
import 'package:movies_app/config/browse_provider.dart';
import 'package:movies_app/config/watchList_provider.dart';
import 'package:movies_app/features/page_browse/film_of_category_details.dart';
import 'package:movies_app/features/page_browse/filmsListById.dart';
import 'package:movies_app/features/splash_screen/splashScreen.dart';
import 'package:movies_app/my_theme/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'features/page_browse/browse_screen.dart';
import 'features/page_home_screen/home_screen.dart';
import 'features/page_search/search_screen.dart';
import 'features/page_watchList/watchList_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.settings=
  const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  await FirebaseFirestore.instance.enableNetwork();
  runApp(MultiProvider(
    providers: [
         ChangeNotifierProvider<WatchlistProvider>(create: (BuildContext context) => WatchlistProvider(),) ,
         ChangeNotifierProvider<BrowseProvider>(create: (BuildContext context) => BrowseProvider(),) ,
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.darkMode,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName:(context)=>const SplashScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        WatchListScreen.routeName: (context) => const WatchListScreen(),
        SearchScreen.routeName: (context) =>  SearchScreen(),
        BrowseScreen.routeName: (context) => const BrowseScreen(),
        FilmsListByI.routeName:(context)=>    const FilmsListByI(),
        FilmOfCategoryDetails.routeName:(context)=> const FilmOfCategoryDetails()
      },
      // onGenerateRoute: (settings) {
      //   if (settings.name == BrowseScreen.routeName) {
      //     final value = settings.arguments as Genres; // Retrieve the value.
      //     return MaterialPageRoute(builder: (_) => FilmsListById(value: value)); // Pass it to BarPage.
      //   }
      //   return null; // Let `onUnknownRoute` handle this behavior.
      // },
    );
  }
}
