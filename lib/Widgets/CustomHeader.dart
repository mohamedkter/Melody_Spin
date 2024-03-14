import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {

final String HeaderTitle;
  const CustomHeader({
    super.key, required this.HeaderTitle,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(HeaderTitle,
            style: TextStyle(
                fontFamily: "raleway",
                fontSize: 23,
                color: Colors.white,
                fontWeight: FontWeight.w700)),
        Text("View more",
            style: TextStyle(
                fontFamily: "raleway",
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w700))
      ],
    );
  }
}




