import 'package:melody_spin/Cubit/MovieCubit/MovieStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MovieCubit extends Cubit<MovieStates>{
  MovieCubit() : super(MovieLoading());


}