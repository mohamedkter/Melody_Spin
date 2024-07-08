
import 'package:flutter/material.dart';
import 'package:melody_spin/Constants/Constants_Color.dart';
import 'package:melody_spin/Models/MovieModel.dart';
import 'package:melody_spin/Screens/LoadingScreens/HomePageLoading.dart';
import 'package:melody_spin/Services/MoviesService.dart';
import 'package:melody_spin/Widgets/CustomCircularProgress.dart';
import 'package:melody_spin/Widgets/CustomHeader.dart';
import 'package:melody_spin/Widgets/CustomSearchWidget.dart';
import 'package:melody_spin/Widgets/MovieCard.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<MovieModel>? trending_movies;
  List<MovieModel>? upcoming_movies;

  bool loading = true;
  @override
  void initState() {
    super.initState();

    _getAllMovies();
  }

  Future<void> _getAllMovies() async {
    trending_movies = await MoviesService()
        .FetchApi("trending/movie/day?language=en-US", "results");
    upcoming_movies = await MoviesService()
        .FetchApi("movie/upcoming?language=en-US&page=1", "results");
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading == true
        ? const HomePageLoading()
        : Container(
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [D_mainColor, L_mainColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomSearchWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const CustomHeader(
                          HeaderTitle: "Trending Movies",
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: SizedBox(
                            height: 200,
                            child: ListView.builder(
                                itemCount: trending_movies?.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    MovieCard(Movie: trending_movies?[index])),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const CustomHeader(
                          HeaderTitle: "Upcoming Movies",
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: SizedBox(
                            height: 200,
                            child: ListView.builder(
                                itemCount: upcoming_movies?.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    MovieCard(Movie: upcoming_movies?[index])),
                          ),
                        ),
                  SizedBox(height: 20,),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
