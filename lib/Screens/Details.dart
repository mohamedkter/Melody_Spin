import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melody_spin/Cubit/FavoriteCubit/FavoriteCubit.dart';
import 'package:melody_spin/Cubit/FavoriteCubit/FavoriteStates.dart';
import 'package:melody_spin/Database/database.dart';
import 'package:melody_spin/Models/CastModel.dart';
import 'package:melody_spin/Models/DetailsMovieModel.dart';
import 'package:melody_spin/Models/MovieModel.dart';
import 'package:melody_spin/Services/MoviesService.dart';
import 'package:melody_spin/Widgets/CastWidget.dart';
import 'package:melody_spin/Widgets/CustomCircularProgress.dart';
import 'package:melody_spin/Widgets/CustomHeaderWithoutAction.dart';
import 'package:melody_spin/Widgets/MovieCard.dart';
import 'package:melody_spin/Widgets/MovieTrailerWidget.dart';
import 'package:melody_spin/Widgets/StorylineWidget.dart';

class Details extends StatefulWidget {
  final MovieModel Movie;
  const Details({super.key, required this.Movie});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  DetailsMovie? MovieDetailes;
  List<MovieModel>? movies;
  List<Cast_Item> cast_items = [];
 // late bool is_Favorite ;
  bool loading = true;
  @override
  void initState() {
    super.initState();
    _getMovieDetails();
  }

  Future<void> _getMovieDetails() async {
    MovieDetailes = await MoviesService().FetchDetailsApi("${widget.Movie.id}");
    cast_items = await MoviesService().FetchCastApi("${widget.Movie.id}");
    movies = await MoviesService().FetchApi(
        "movie/${widget.Movie.id}/recommendations?language=en-US&page=1",
        "results");
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: loading == true
          ? const CustomCircularProgress()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieTrailerWidget(
                    is_Favorite: true,//is_Favorite,
                    IconButtonFunction: () {
                      setState(() {
                        //is_Favorite = !is_Favorite;
                      });
                       MyDatabase.insertMovie(widget.Movie);

                    },
                    MovieName: MovieDetailes!.title,
                    Movie_Poster: MovieDetailes!.backdrop_path,
                    original_language: MovieDetailes!.original_language,
                  ),
                  StorylineWidget(
                    StorylineText: MovieDetailes == null
                        ? "overview"
                        : MovieDetailes!.overview,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CastWidget(
                    cast_items: cast_items,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: CustomHeaderWithoutAction(
                      HeaderTitle: "Recommended",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: SizedBox(
                      height: 200,
                      child: ListView.builder(
                          itemCount: movies?.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              MovieCard(Movie: movies?[index])),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            )
          
          
          
    );
  }
}
