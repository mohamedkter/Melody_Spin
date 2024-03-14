import 'package:flutter/material.dart';
import 'package:melody_spin/Constants/Constants_Color.dart';

class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [D_mainColor, L_mainColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Center(
        child: CircularProgressIndicator(
          color: D_mainColor,
          backgroundColor: L_mainColor,
        ),
      ),
    );
  }
}