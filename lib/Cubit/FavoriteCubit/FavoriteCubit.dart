import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melody_spin/Cubit/FavoriteCubit/FavoriteStates.dart';
import 'package:melody_spin/Models/DetailsMovieModel.dart';

class FavoriteCubit extends Cubit<FavoriteStates> {
  FavoriteCubit() : super(EmptyFavorites());
  List<DetailsMovie?>Movies = [];
  void addMovie(DetailsMovie? movie) {
    Movies.add(movie);

    emit(AddMovieToFavorites());
    print(Movies.length);
  }

bool findMovie(DetailsMovie? movie){
return Movies.contains(movie);
}
  void removeMovie(DetailsMovie? movie) {
    Movies.remove(movie);
    emit(RemoveMovieFromFavorites());
  }
}
