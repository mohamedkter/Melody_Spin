import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melody_spin/Constants/Constants_Color.dart';
import 'package:melody_spin/Cubit/FavoriteCubit/FavoriteCubit.dart';
import 'package:melody_spin/Cubit/FavoriteCubit/FavoriteStates.dart';
import 'package:melody_spin/Widgets/FavoriteCard.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: L_mainColor,
      body:
      BlocBuilder<FavoriteCubit,FavoriteStates>(builder: (context,states){
        return SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [D_mainColor, L_mainColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: ListView.builder(
            itemBuilder: (context, index) => FavoriteCard(Movie: BlocProvider.of<FavoriteCubit>(context).Movies[index]),
            itemCount: BlocProvider.of<FavoriteCubit>(context).Movies.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
      ); 
      })
       
    );
  }
}
