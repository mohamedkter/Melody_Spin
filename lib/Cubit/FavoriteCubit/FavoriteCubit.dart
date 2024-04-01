import 'package:bloc/bloc.dart';
import 'package:melody_spin/Cubit/FavoriteCubit/FavoriteStates.dart';
import 'package:melody_spin/Models/MovieModel.dart';

class FavoriteCubit extends Cubit<FavoriteStates> {
  FavoriteCubit(super.initialState);
  List<MovieModel> Movies = [];
  void addMovie(MovieModel movie) {
    Movies.add(movie);

    emit(AddMovieToFavorites());
  }

  void removeMovie(MovieModel movie) {
    Movies.remove(movie);
    emit(RemoveMovieFromFavorites());
  }
}
