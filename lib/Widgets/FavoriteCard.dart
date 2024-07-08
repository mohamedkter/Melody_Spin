import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:melody_spin/Constants/Constants_Color.dart';
import 'package:melody_spin/Models/DetailsMovieModel.dart';
import 'package:readmore/readmore.dart';

class FavoriteCard extends StatelessWidget {
  final DetailsMovie? Movie;
  const FavoriteCard({
    super.key, this.Movie,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 16, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade800.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                "https://image.tmdb.org/t/p/w500${Movie?.poster_path}",
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReadMoreText("${Movie?.title}",trimLength: 50,trimMode: TrimMode.Length,style: TextStyle(fontFamily:"raleway",fontSize: 17,color: Colors.white,fontWeight: FontWeight.w700 )),
                Text("Action",style: TextStyle(fontFamily:"raleway",fontSize: 15,fontWeight: FontWeight.w700,color: Colors.grey )),
              ],
            ),
            Icon(Icons.play_circle,color: IconColor,)
          ],
        ),
      ),
    );
  }
}
