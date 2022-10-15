 
class TrendingPersonModel {
  int? page;
  List<TrendingPerson>? results;

  TrendingPersonModel({this.page, this.results});

  TrendingPersonModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <TrendingPerson>[];
      json['results'].forEach((v) {
        results!.add(new TrendingPerson.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TrendingPerson {
  String? profilePath;
  String? name;
  List<KnownFor>? knownFor;
  int? id;
  bool? adult;
  int? gender;
  String? knownForDepartment;
  double? popularity;
  String? mediaType;

  TrendingPerson(
      {this.profilePath,
      this.name,
      this.knownFor,
      this.id,
      this.adult,
      this.gender,
      this.knownForDepartment,
      this.popularity,
      this.mediaType});

  TrendingPerson.fromJson(Map<String, dynamic> json) {
    profilePath = json['profile_path'];
    name = json['name'];
    if (json['known_for'] != null) {
      knownFor = <KnownFor>[];
      json['known_for'].forEach((v) {
        knownFor!.add(new KnownFor.fromJson(v));
      });
    }
    id = json['id'];
    adult = json['adult'];
    gender = json['gender'];
    knownForDepartment = json['known_for_department'];
    popularity = json['popularity'];
    mediaType = json['media_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_path'] = this.profilePath;
    data['name'] = this.name;
    if (this.knownFor != null) {
      data['known_for'] = this.knownFor!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['adult'] = this.adult;
    data['gender'] = this.gender;
    data['known_for_department'] = this.knownForDepartment;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    return data;
  }
}

class KnownFor {
  List<int>? genreIds;
  String? originalLanguage;
  String? title;
  String? posterPath;
  String? mediaType;
  bool? video;
  double? voteAverage;
  double? popularity;
  String? overview;
  String? releaseDate;
  dynamic voteCount;
  dynamic id;
  bool? adult;
  String? backdropPath;
  String? originalTitle;

  KnownFor(
      {this.genreIds,
      this.originalLanguage,
      this.title,
      this.posterPath,
      this.mediaType,
      this.video,
      this.voteAverage,
      this.popularity,
      this.overview,
      this.releaseDate,
      this.voteCount,
      this.id,
      this.adult,
      this.backdropPath,
      this.originalTitle});

  KnownFor.fromJson(Map<String, dynamic> json) {
    genreIds = json['genre_ids'].cast<int>();
    originalLanguage = json['original_language'];
    title = json['title'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    video = json['video'];
    voteAverage = json['vote_average'];
    popularity = json['popularity'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    voteCount = json['vote_count'];
    id = json['id'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    originalTitle = json['original_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['genre_ids'] = this.genreIds;
    data['original_language'] = this.originalLanguage;
    data['title'] = this.title;
    data['poster_path'] = this.posterPath;
    data['media_type'] = this.mediaType;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['popularity'] = this.popularity;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['vote_count'] = this.voteCount;
    data['id'] = this.id;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['original_title'] = this.originalTitle;
    return data;
  }
}