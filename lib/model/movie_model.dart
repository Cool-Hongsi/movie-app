class MovieModel {
  String? title;
  // int? year;
  String? year;
  String? imdbID;
  String? type;
  String? poster;

  MovieModel({
    this.title,
    this.year,
    this.imdbID,
    this.type,
    this.poster
  });

  MovieModel.fromJSON(Map<String, dynamic> json) {
    title = json['Title'] ?? '';
    // year = int.parse(json['Year']);
    year = json['Year'] ?? ''; // Some of movies have "1972-1997" Year value
    imdbID = json['imdbID'] ?? '';
    type = json['Type'] ?? '';
    poster = json['Poster'] ?? '';
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['title'] = title;
    data['year'] = year;
    data['imdbID'] = imdbID;
    data['type'] = type;
    data['poster'] = poster;

    return data;
  }
}
