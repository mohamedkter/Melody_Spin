import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melody_spin/Cubit/FavoriteCubit/FavoriteStates.dart';
import 'package:melody_spin/Database/database.dart';
import 'package:melody_spin/Models/DetailsMovieModel.dart';
import 'package:melody_spin/Models/MovieModel.dart';

class FavoriteCubit extends Cubit<FavoriteStates> {
  FavoriteCubit() : super(EmptyFavorites());
  List<MovieModel> Movies = [];
  Future<void> getAllFavoriteMovies() async {
    emit(FavoriteLoadingState());
    List<dynamic> favoriteMovies = await MyDatabase.getAllMovies();
    if (favoriteMovies.isEmpty) {
      emit(EmptyFavorites());
    } else {
      List<Map<String, dynamic>> moviesMap = await MyDatabase.getAllMovies();
      Movies =
          moviesMap.map((movieMap) => MovieModel.fromMap(movieMap)).toList();
      emit(FavoritesSuccessState());
    }
    print(Movies.length);
  }

  bool findMovie(DetailsMovie? movie) {
    return Movies.contains(movie);
  }
}
