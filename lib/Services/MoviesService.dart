import 'package:dio/dio.dart';
import 'package:melody_spin/Models/CastModel.dart';
import 'package:melody_spin/Models/DetailsMovieModel.dart';
import 'package:melody_spin/Models/MovieModel.dart';

class MoviesService {
  var dio = Dio();
  final options = Options(
    method: 'GET',
    headers: {
      'accept': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMzVjMGQzNDg3NTMyNGI4ZWVlYTA2NGQxYmFlNWZmOSIsInN1YiI6IjY0YTE2OTNjZDUxOTFmMDEzOTNlODhhYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.NSrpPiCM2H-TEA0S2Vbd7DUt84bOWqAoxYuvcLIsvz8',
    },
  );
  DetailsMovie? MovieDetailes;
  late List<MovieModel> Movies = [];
  late List<Cast_Item> cast_items = [];
  Future<dynamic> FetchApi(String url,String DataName) async {
    try {
      final response =
          await dio.get('https://api.themoviedb.org/3/$url', options: options);
      for (var Movie in response.data["$DataName"]) {
        Movies.add(MovieModel(
            Movie["id"],
            Movie["title"],
            Movie["poster_path"],
            Movie["backdrop_path"],
            Movie["popularity"],
            Movie["video"],
            Movie["release_date"],
            Movie["vote_average"]
            ));
      }
      ;
      return Movies;
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<dynamic> FetchCastApi(String id) async {
    try {
      final response = await dio.get(
          'https://api.themoviedb.org/3/movie/$id/credits?language=en-US',
          options: options);
      for (var cast_item in response.data["cast"]) {
        cast_items.add(Cast_Item(
            id: cast_item["id"],
            name: cast_item["name"],
            profile_path: cast_item["profile_path"],
            department: cast_item["known_for_department"]));
      }
      return cast_items;
    } catch (error) {
      print('Error: $error');
      throw error;
    }
  }

  Future<dynamic> FetchDetailsApi(String id) async {
    try {
      final response = await dio.get('https://api.themoviedb.org/3/movie/$id',
          options: options);
      print(response.data["original_title"]);
      MovieDetailes = DetailsMovie(
          original_language: response.data["original_language"],
          backdrop_path: response.data["backdrop_path"],
          overview: response.data["overview"],
          popularity: response.data["popularity"],
          poster_path: response.data["poster_path"],
          title: response.data["title"],
          vote_average: response.data["vote_average"]);
      return MovieDetailes;
    } catch (e) {
      print(e);
    }
  }
}
