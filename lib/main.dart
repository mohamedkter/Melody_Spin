import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melody_spin/Constants/Constants_Color.dart';
import 'package:melody_spin/Cubit/FavoriteCubit/FavoriteCubit.dart';
import 'package:melody_spin/Screens/Categories.dart';
import 'package:melody_spin/Screens/Favorites.dart';
import 'package:melody_spin/Screens/MainScreen.dart';
import 'package:melody_spin/Screens/Profiles.dart';
import 'package:melody_spin/Screens/LoadingScreens/HomePageLoading.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => FavoriteCubit(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> pages = [
    const MainScreen(),
    const Favorites(),
    const Categories(),
    const Profiles()
  ];
  // ignore: non_constant_identifier_names
  int _CurrentIndex = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Melody Spin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade800),
        useMaterial3: true,
      ),
      home: 
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
              leading: IconButton(
                onPressed: () {
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Categories()));
                },
                icon: const Icon(
                  Icons.grid_view_rounded,
                  color: Colors.white,
                ),
              ),
              actions: [
                Container(
                  margin: EdgeInsets.only(right: 15),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/human4.jpg"),
                  ),
                )
              ],
              elevation: 0.0,
              backgroundColor: D_mainColor),
        ),
        body: pages[_CurrentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: D_mainColor,
          selectedItemColor: IconColor,
          unselectedItemColor: Colors.white,
          currentIndex: _CurrentIndex,
          elevation: 0.0,
          onTap: (index) {
            setState(() {
              _CurrentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined), label: "Favorites"),
            BottomNavigationBarItem(
                icon: Icon(Icons.play_circle_fill_outlined), label: "Play"),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_outline), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
