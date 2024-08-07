import 'package:dio/dio.dart';
import 'package:melody_spin/Models/CastModel.dart';
import 'package:melody_spin/Models/DetailsCast.dart';
import 'package:melody_spin/Models/DetailsMovieModel.dart';
import 'package:melody_spin/Models/MovieModel.dart';
import 'package:melody_spin/Screens/Search.dart';

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
  DetailsCast? detailsCast;
  Future<dynamic> FetchApi(String url, String DataName) async {
    try {
      final response =
          await dio.get('https://api.themoviedb.org/3/$url', options: options);
      for (var Movie in response.data["$DataName"]) {
        Movies.add(MovieModel(
            id: Movie["id"],
            title: Movie["title"],
            poster_path: Movie["poster_path"],
            backdrop_path: Movie["backdrop_path"],
            popularity: Movie["popularity"],
            video: Movie["video"],
            release_date: Movie["release_date"],
            vote_average: Movie["vote_average"]));
      }
      ;
      return Movies;
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<dynamic> SearchApi(String query, int page) async {
    try {
      final response = await dio.get(
          'https://api.themoviedb.org/3/search/movie?query=$query&include_adult=false&language=en-US&page=$page',
          options: options);
       if (response.statusCode==200) {
        print("ok");
         return response.data;
       }else{
        return [];
       }   
      return response;
    } catch (error) {
      print('Error: $error');
      return [];
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

  Future<dynamic> FetchCastDetailsApi(String id) async {
    try {
      final response = await dio.get(
          'https://api.themoviedb.org/3/person/$id?language=en-US',
          options: options);

      detailsCast = DetailsCast(
          name: response.data["name"],
          birthday: response.data["birthday"],
          place_of_birth: response.data["place_of_birth"],
          profile_path: response.data["profile_path"],
          known_for_department: response.data["known_for_department"],
          biography: response.data["biography"]);

      return detailsCast;
    } catch (e) {
      print(e);
    }
  }
}
