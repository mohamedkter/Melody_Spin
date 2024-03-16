import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:melody_spin/Constants/Constants_Color.dart';
import 'package:melody_spin/Models/DetailsCast.dart';
import 'package:melody_spin/Models/MovieModel.dart';
import 'package:melody_spin/Services/MoviesService.dart';
import 'package:melody_spin/Widgets/CustomCircularProgress.dart';
import 'package:melody_spin/Widgets/MovieCard.dart';
import 'package:melody_spin/Widgets/StorylineWidget.dart';

class ActorProfile extends StatefulWidget {
  final int? id;
  const ActorProfile({super.key, required this.id});

  @override
  State<ActorProfile> createState() => _ActorProfileState();
}

class _ActorProfileState extends State<ActorProfile> {
  List<MovieModel>? movies;
  DetailsCast? detailsCast;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _getMovieDetails();
  }

  Future<void> _getMovieDetails() async {
    detailsCast= await MoviesService().FetchCastDetailsApi("${widget.id}");
    movies = await MoviesService()
        .FetchApi("person/${widget.id}/movie_credits?language=en-US", "cast");
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: loading == true
            ? const CustomCircularProgress()
            : SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [D_mainColor, L_mainColor],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 10, top: 45),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back,color: Colors.white,)),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  "https://image.tmdb.org/t/p/w500${detailsCast?.profile_path}",
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.favorite_border_outlined),color: Colors.white,)
                          ],
                        ),
                        Text(
                          "${detailsCast?.name}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "raleway"),
                        ),
                        Text(
                          "${detailsCast?.known_for_department}",
                          style:const TextStyle(
                              color: Colors.amber,
                              fontSize: 17,
                              fontFamily: "raleway"),
                        ),
                        Text(
                          "Birthday : ${detailsCast?.birthday} ",
                          textAlign: TextAlign.start,
                          style:const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: "raleway"),
                        ),
                        Text(
                          "Place Of Birth :  ${detailsCast?.place_of_birth}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: "raleway"),
                        ),
                        SizedBox(height: 20,),
                        StorylineWidget(
                            StorylineText:
                                "${detailsCast?.biography}"),
                                
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    
                                    mainAxisSpacing: 40),
                            itemBuilder: (context, index) => SizedBox(
                              height: 200,
                              child: MovieCard(
                                Movie: movies?[index],
                              ),
                            ),
                            itemCount: movies?.length,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
  }
}
