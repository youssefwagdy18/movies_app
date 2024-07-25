// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/Favourites.dart';

class FireBaseUtils{
  static CollectionReference<Favourites> getFilmCollection(){
    return FirebaseFirestore.instance.collection(Favourites.routeName).withConverter(
        fromFirestore: (snapshot,_)=>Favourites.fromJson(snapshot.data()),
        toFirestore: (favFilm,_)=>favFilm.toJson());
  }

  static Future<void> addFilmToFireBase(Favourites fav){
    var collectionRef = getFilmCollection();
    var filmRef = collectionRef.doc(fav.favId);
    return filmRef.set(fav);
  }

  static Future<void> deleteFilmFromFireBase(Favourites fav){
    return getFilmCollection().doc(fav.favId).delete();
  }

  // static Future<Favourites?> readFilmFromFireBase() async{
  //   var querySnapshot= await getFilmCollection().doc().get();
  //   return querySnapshot.data();
  // }
}