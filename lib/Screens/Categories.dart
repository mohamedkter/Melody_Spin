import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            actions: [
              Container(
                margin: EdgeInsets.only(right: 15),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/human4.jpg"),
                ),
              )
            ],
            elevation: 0.0,
            backgroundColor: Colors.grey.shade800.withOpacity(0.8),
          ),
    ));
  }
}