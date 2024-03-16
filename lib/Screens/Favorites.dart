import 'package:flutter/material.dart';
import 'package:melody_spin/Constants/Constants_Color.dart';
import 'package:melody_spin/Widgets/FavoriteCard.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [D_mainColor, L_mainColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: ListView.builder(
            itemBuilder: (context, index) => FavoriteCard(),
            itemCount: 20,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
      ),
    );
  }
}
