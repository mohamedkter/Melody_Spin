import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melody_spin/Cubit/SearchCubit/SearchStates.dart';
import 'package:melody_spin/Models/MovieModel.dart';
import 'package:melody_spin/Services/MoviesService.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit():super(SearchLoading());
  List<MovieModel> movies = [];
  int? NumberOfPage;
  Future<void> movieSearch(String query, int page) async {
    emit(SearchLoading());
    dynamic res = await MoviesService().SearchApi(query, page);
    if (res==[]) {
      emit(SearchFailure());
    } else {
      List<dynamic> resMovie = res["results"];
      movies = resMovie.map((e) => MovieModel.fromMap(e)).toList();
      NumberOfPage = res["total_pages"];
      emit(SearchSuccess());
    }
  }
}
