import 'package:flutter/material.dart';
import 'package:melody_spin/Models/CastModel.dart';
import 'package:melody_spin/Screens/ActorProfile.dart';

class CastWidget extends StatelessWidget {
  final List<Cast_Item> cast_items;

  const CastWidget({super.key, required this.cast_items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Star cast",
            style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontFamily: "raleway",
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
              height: 80,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ActorProfile(id:cast_items[index].id,)));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://image.tmdb.org/t/p/w500${cast_items[index].profile_path}"),
                            radius: 30,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${cast_items[index].department}",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontFamily: "raleway"),
                              ),
                              Text(
                                "${cast_items[index].name}",
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: "raleway"),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                itemCount: cast_items.length,
                scrollDirection: Axis.horizontal,
              ))
        ],
      ),
    );
  }
}
