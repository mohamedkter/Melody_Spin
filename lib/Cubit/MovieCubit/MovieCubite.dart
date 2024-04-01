import 'package:melody_spin/Cubit/MovieCubit/MovieStates.dart';
import 'package:bloc/bloc.dart';
class MovieCubit extends Cubit<MovieStates>{
  MovieCubit() : super(MovieLoading());


}