import 'package:flutter/material.dart';
import 'package:melody_spin/Constants/Constants_Color.dart';

class MovieTrailerWidget extends StatelessWidget {
  final String MovieName;
  final String original_language;
  final String Movie_Poster;
  const MovieTrailerWidget({
    super.key,
    required this.MovieName,
    required this.original_language,
    required this.Movie_Poster,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 600,
      decoration: BoxDecoration(
          image: DecorationImage(
              image:
                  NetworkImage("https://image.tmdb.org/t/p/w500$Movie_Poster"),
              fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: IconColor,
                        size: 30,
                      )),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      color: IconColor,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 300,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    print("Tralier");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50)),
                        color: const Color.fromARGB(255, 105, 104, 104)
                            .withOpacity(0.6)),
                    width: 200,
                    height: 60,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Icon(
                            color: IconColor,
                            Icons.play_circle,
                            size: 40,
                          ),
                        ),
                        const Text(
                          "Watch Trailer",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: "raleway"),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: 152,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black, Colors.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "$MovieName",
                    style: TextStyle(
                        fontFamily: "raleway",
                        fontSize: 27,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "${original_language}  |  Action,secFi  |  3h10m",
                    style: TextStyle(
                        fontFamily: "raleway",
                        color: Colors.grey.shade500,
                        fontSize: 15),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: Divider(
                      thickness: 0.5,
                      endIndent: 0,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
