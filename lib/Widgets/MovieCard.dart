import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:melody_spin/Constants/Constants_Color.dart';
import 'package:melody_spin/Models/MovieModel.dart';
import 'package:melody_spin/Screens/Details.dart';


class MovieCard extends StatelessWidget {
  final MovieModel? Movie;

const MovieCard({
    super.key,
    required this.Movie,
  });

String Number_format(double? num){
 var format=NumberFormat("#.#");
return format.format(num);
}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Details(
                    MovieId: "${Movie?.id}",
                  )));
        },
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500${Movie?.poster_path}"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12)),
          width: 160,
          height: 150,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 70),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(12)),
                      child: Icon(Icons.play_circle, color: L_mainColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 50,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.36,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 120,
                              child: Text("${Movie?.title}",
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.fade,
                                  textWidthBasis: TextWidthBasis.parent,
                                  style: TextStyle(
                                      fontFamily: "raleway",
                                      fontSize: 15,
                                      color: Colors.grey.shade800,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // here we go
               Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                         const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text("${Number_format(Movie?.vote_average)}",
                              style:const TextStyle(
                                  fontFamily: "raleway",
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                      Text("${Movie?.popularity} View",
                          style:const TextStyle(
                              fontFamily: "raleway",
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w700))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
