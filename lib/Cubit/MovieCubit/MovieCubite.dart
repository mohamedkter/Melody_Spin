import 'package:melody_spin/Cubit/MovieCubit/MovieStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melody_spin/Models/MovieModel.dart';
import 'package:melody_spin/Services/MoviesService.dart';

class MovieCubit extends Cubit<MovieStates> {
  MovieCubit() : super(MovieLoading());

  List<MovieModel>? trendingMovies;
  List<MovieModel>? upcomingMovies;
  Future<void> getAllMovies() async {
    emit(MovieLoading());
    List<MovieModel> trendingMoviesResp = await MoviesService()
        .FetchApi("trending/movie/day?language=en-US", "results");
    List<MovieModel> upcomingMoviesResp = await MoviesService()
        .FetchApi("movie/upcoming?language=en-US&page=1", "results");
    if (trendingMoviesResp.isEmpty || upcomingMoviesResp.isEmpty) {
      emit(MovieFailure());
    } else {
      trendingMovies = trendingMoviesResp;
      upcomingMovies = upcomingMoviesResp;
      emit(MovieSuccess());
    }
  }
}
