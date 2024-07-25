
// ignore_for_file: file_names

class Favourites{
  static String routeName = 'favourites';
Favourites({
   this.favTitle,
   this.favPoster,
   this.favDate,
   this.favId,
   this.isSelectedFilm,
   this.favIndex,
  this.backdropPath,
  this.popularity,
  this.overview,
  this.genreIds,
  this.voteAverage
});
String? favTitle;
String? favPoster;
String? favDate;
String? favId;
bool? isSelectedFilm;
int? favIndex;
String? backdropPath;
List<int>? genreIds;
String? overview;
double? popularity;
double? voteAverage;




Favourites.fromJson(dynamic json){
  favTitle = json['favTitle'];
  favPoster = json['favPoster'];
  favDate = json['favDate'];
  favId = json['favId'];
  isSelectedFilm = json['isSelectedFilm'];
  favIndex = json['favIndex'];
  backdropPath = json['backdropPath'];
  genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
  overview = json['overview'];
  popularity = json['popularity'];
  voteAverage = json['voteAverage'];

}

Map<String ,dynamic>toJson(){
  final map = <String,dynamic>{};
  map['favTitle']=favTitle;
  map['favPoster']=favPoster;
  map['favDate']=favDate;
  map['favId']=favId;
  map['isSelectedFilm']=isSelectedFilm;
  map['favIndex']=favIndex;
  map['backdropPath']=backdropPath;
  map['genre_ids'] = genreIds;
  map['overview']=overview;
  map['popularity']=popularity;
  map['voteAverage']=voteAverage;
  return map;
}
}