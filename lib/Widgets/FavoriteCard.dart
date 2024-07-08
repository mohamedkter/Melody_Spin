import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melody_spin/Constants/Constants_Color.dart';
import 'package:melody_spin/Cubit/FavoriteCubit/FavoriteCubit.dart';
import 'package:melody_spin/Database/database.dart';
import 'package:melody_spin/Models/DetailsMovieModel.dart';
import 'package:melody_spin/Models/MovieModel.dart';
import 'package:readmore/readmore.dart';

class FavoriteCard extends StatelessWidget {
  final MovieModel? Movie;
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
               Container(
                width: 150,
                child: Text("${Movie?.title}",overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily:"raleway",fontSize: 17,color: Colors.white,fontWeight: FontWeight.w700 ))),
                const Text("Action",style: TextStyle(fontFamily:"raleway",fontSize: 15,fontWeight: FontWeight.w700,color: Colors.grey )),
              ],
            ),
            IconButton(onPressed: (){
              MyDatabase.deleteMovie(Movie!.id);
              BlocProvider.of<FavoriteCubit>(context).getAllFavoriteMovies();
            }, icon:Icon(Icons.delete_forever_rounded,color: IconColor,size: 30,))
          ],
        ),
      ),
    );
  }
}
