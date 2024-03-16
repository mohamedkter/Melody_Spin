import 'package:flutter/material.dart';
import 'package:melody_spin/Constants/Constants_Color.dart';
import 'package:melody_spin/Models/MovieModel.dart';
import 'package:melody_spin/Screens/Categories.dart';
import 'package:melody_spin/Screens/Favorites.dart';
import 'package:melody_spin/Screens/Profiles.dart';
import 'package:melody_spin/Services/MoviesService.dart';
import 'package:melody_spin/Widgets/CustomCircularProgress.dart';
import 'package:melody_spin/Widgets/CustomHeader.dart';
import 'package:melody_spin/Widgets/CustomSearchWidget.dart';
import 'package:melody_spin/Widgets/FavoriteCard.dart';
import 'package:melody_spin/Widgets/MovieCard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> pages = [MainScreen(), Favorites(), Categories(), Profiles()];
  // ignore: non_constant_identifier_names
  int _CurrentIndex = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Melody Spin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade800),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
              leading: IconButton(
                onPressed: () {
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Categories()));
                },
                icon: const Icon(
                  Icons.grid_view_rounded,
                  color: Colors.white,
                ),
              ),
              actions: [
                Container(
                  margin: EdgeInsets.only(right: 15),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/human4.jpg"),
                  ),
                )
              ],
              elevation: 0.0,
              backgroundColor: D_mainColor),
        ),
        body: pages[_CurrentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: D_mainColor,
          selectedItemColor: IconColor,
          unselectedItemColor: Colors.white,
          currentIndex: _CurrentIndex,
          elevation: 0.0,
          onTap: (index) {
            setState(() {
              _CurrentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined), label: "Favorites"),
            BottomNavigationBarItem(
                icon: Icon(Icons.play_circle_fill_outlined), label: "Play"),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_outline), label: "Profile"),
          ],
        ),
      ),
    );
  }
}

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
        ? const CustomCircularProgress()
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
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
