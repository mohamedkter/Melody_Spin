class MovieModel {
  final int id;
  final String? title;
  final String? poster_path;
  final double? popularity;
  final bool? video;
  final String? release_date;
  final String? backdrop_path;
  final double? vote_average;

  MovieModel({
    required this.id,
    this.title,
    this.poster_path,
    this.popularity,
    this.video,
    this.release_date,
    this.backdrop_path,
    this.vote_average,
  });

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'],
      title: map['title'],
      poster_path: map['poster_path'],
      popularity: map['popularity'],
      video: map['video'] == 1,
      release_date: map['release_date'],
      backdrop_path: map['backdrop_path'],
      vote_average: map['vote_average'],
    );
  }
}
