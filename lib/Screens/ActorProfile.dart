import 'package:flutter/material.dart';
import 'package:melody_spin/Models/MovieModel.dart';
import 'package:melody_spin/Services/MoviesService.dart';
import 'package:melody_spin/Widgets/CustomCircularProgress.dart';
import 'package:melody_spin/Widgets/MovieCard.dart';

class ActorProfile extends StatefulWidget {
  final  int? id; 
  const ActorProfile({super.key, required this.id});

  @override
  State<ActorProfile> createState() => _ActorProfileState();
}

class _ActorProfileState extends State<ActorProfile> {
  List<MovieModel> ?movies;
  bool loading = true;

   @override
  void initState() {
    super.initState();
    _getMovieDetails();
  }

  Future<void> _getMovieDetails() async {
    movies = await MoviesService().FetchApi("person/${widget.id}/movie_credits?language=en-US","cast");
    setState(() {
      loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: loading == true
          ?const CustomCircularProgress()
          :GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10), itemBuilder:(context,index)=> MovieCard(Movie: movies?[index],),itemCount: movies?.length,)
    );
  }
}
