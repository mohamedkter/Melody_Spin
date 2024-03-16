import 'package:flutter/material.dart';
import 'package:melody_spin/Constants/Constants_Color.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    super.key,
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
            Image.asset(
              "assets/images/human4.jpg",
              width: 80,
              height: 80,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hip-Hop405 Mix",style: TextStyle(fontFamily:"raleway",fontSize: 17,color: Colors.white,fontWeight: FontWeight.w700 )),
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
