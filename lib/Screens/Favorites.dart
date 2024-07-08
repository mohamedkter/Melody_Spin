import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melody_spin/Constants/Constants_Color.dart';
import 'package:melody_spin/Cubit/FavoriteCubit/FavoriteCubit.dart';
import 'package:melody_spin/Cubit/FavoriteCubit/FavoriteStates.dart';
import 'package:melody_spin/Widgets/FavoriteCard.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FavoriteCubit>(context).getAllFavoriteMovies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: L_mainColor,
      body:
      BlocBuilder<FavoriteCubit,FavoriteStates>(builder: (context,state){
   if (state is FavoritesSuccessState) {
     return  SingleChildScrollView(
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
            physics: const NeverScrollableScrollPhysics(),
          ),
        ),
      );
   }else if(state is EmptyFavorites){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
            width: 150,
            height: 150,
            child: Image.asset("assets/images/error-404.png")),
            const SizedBox(height: 10,),
             Text("Not Found Favorites",style: TextStyle(color: IconColor,fontSize: 22),)
        ],),),
      ],
    );
   }else{
    return SizedBox();
   }
      })
       
    );
  }
}

