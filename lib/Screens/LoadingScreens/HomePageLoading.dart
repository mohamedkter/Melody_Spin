import 'package:flutter/material.dart';
import 'package:melody_spin/Constants/Constants_Color.dart';
import 'package:melody_spin/Widgets/CustomHeader.dart';
import 'package:melody_spin/Widgets/CustomSearchWidget.dart';
import 'package:shimmer/shimmer.dart';

class HomePageLoading extends StatelessWidget {
  const HomePageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:D_mainColor ,
      body: Shimmer.fromColors(
          baseColor: Color.fromARGB(255, 49, 45, 45),
          highlightColor: L_mainColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Padding(
                  padding: const EdgeInsets.only(top: 55, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 300,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 370,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 35,),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 200,
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                      ),
                      Container(
                        width: 100,
                        height: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                      ),
                    ],
                  ),
                ), SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 165,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                      ),
                      Container(
                        width: 165,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 200,
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                      ),
                      Container(
                        width: 100,
                        height: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                      ),
                    ],
                  ),
                ), SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 165,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                      ),
                      Container(
                        width: 165,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
