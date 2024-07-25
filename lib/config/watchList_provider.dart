// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:movies_app/fireBaseUtils.dart';
import 'package:movies_app/Favourites.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/my_theme/my_theme.dart';

class WatchlistProvider extends ChangeNotifier {
  bool isSelected = false;
  var selectedIndex = <int>[];
  var compareList = <int>[];
  var filmList = <Favourites>[];
  var selectedList = <bool>[];

  selectedIcon (bool newTab) {
    if(newTab ==false){
      return const Icon(
        color: MyTheme.lightGreyColor,
        Icons.favorite,
        size: 35,
      );
    }else{
      return const Icon(
        color: Colors.yellow,
        Icons.favorite,
        size: 35,
      );
    }
  }
  unSelectedIcon (bool newTab) {
    if(newTab ==true){
      return const Icon(
        color: MyTheme.lightGreyColor,
        Icons.favorite,
        size: 35,
      );
    }else{
      return const Icon(
        color: Colors.yellow,
        Icons.favorite,
        size: 35,
      );
    }
  }
  // addSelectedList(bool select , int index){
  //   for(int i = 0 ; i<filmList.length; i++){
  //     if(index == i){
  //       selectedList.add(true);
  //     }
  //     else {
  //       selectedList.add(false);
  //     }
  //   selectedList = filmList.;
  //   print(selectedList);
  //   print(selectedList.length);
  //   }
  // }

  addingIndex(int index) {
    selectedIndex.add(index);
  }

  sortingIndex() {
    selectedIndex.sort((a, b) => a.compareTo(b));
  }

  removingIndex(int index) {
    selectedIndex.remove(index);
  }

  // Future<void> storingSharedPref(bool isSelected) async {
  //   if (isSelected == false) {
  //     return;
  //   }
  //   isSelected == true;
  //   // Obtain shared preferences.
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool('isSelected', isSelected == true);
  // }
  //
  // Future<bool?> readSharedPref() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool? isSelected = prefs.getBool('isSelected');
  //   if (isSelected == true) {
  //     return isSelected;
  //   }
  //   return isSelected;
  // }

  getAllFilmsFromFireStore() async {
    QuerySnapshot<Favourites> querySnapshot =
        await FireBaseUtils.getFilmCollection().get();
    filmList = querySnapshot.docs.map((docs) {
      return docs.data();
    }).toList();
    filmList.sort(
      (a, b) {
        return a.favIndex!.compareTo(b.favIndex!);
      },
    );
  }

  @override
  notifyListeners();
}


// collectingFilms(int index){
//   selectedId.asMap().forEach((index, value) => index);
//   filmList[index];
