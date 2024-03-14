import 'package:flutter/material.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome",
            style: TextStyle(
                fontFamily: "raleway",
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 5,
          ),
          Text("Enjoy your favorite Movies",
              style: TextStyle(
                  fontFamily: "raleway",
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w700)),
          SizedBox(
            height: 20,
          ),
          TextField(
            style: TextStyle(
                fontFamily: "raleway",
                fontSize: 15,
                fontWeight: FontWeight.w700),
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search_rounded),
                hintText: "Search",
                hintStyle: TextStyle(
                    fontFamily: "raleway",
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none)),
          ),
        ],
      ),
    );
  }
}
