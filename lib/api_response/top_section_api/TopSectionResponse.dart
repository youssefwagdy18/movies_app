// ignore_for_file: file_names, non_constant_identifier_names

class TopSectionResponse {
  TopSectionResponse({
      this.page, 
      this.results, 
      this.totalPages,
    this.status_code,
    this.status_message,
    this.success,
      this.totalResults,});

  TopSectionResponse.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Result.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    status_code = json['status_code'];
    status_message = json['status_message'];
    success = json['success'];
  }
  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;
  int? status_code;
  String? status_message;
  bool?  success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }

}

/// adult : false
/// backdrop_path : "/sR0SpCrXamlIkYMdfz83sFn5JS6.jpg"
/// genre_ids : [28,878,12]
/// id : 823464
/// original_language : "en"
/// original_title : "Godzilla x Kong: The New Empire"
/// overview : "Following their explosive showdown, Godzilla and Kong must reunite against a colossal undiscovered threat hidden within our world, challenging their very existence – and our own."
/// popularity : 3673.963
/// poster_path : "/tMefBSflR6PGQLv7WvFPpKLZkyk.jpg"
/// release_date : "2024-03-27"
/// title : "Godzilla x Kong: The New Empire"
/// video : false
/// vote_average : 6.721
/// vote_count : 409

class Result {
  Result({
      this.adult, 
      this.backdropPath, 
      this.genreIds, 
      this.id, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.popularity, 
      this.posterPath, 
      this.releaseDate, 
      this.title, 
      this.video, 
      this.voteAverage, 
      this.voteCount,});

  Result.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

}