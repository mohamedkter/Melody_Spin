import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melody_spin/Constants/Constants_Color.dart';
import 'package:melody_spin/Cubit/SearchCubit/SearchCubit.dart';
import 'package:melody_spin/Cubit/SearchCubit/SearchStates.dart';
import 'package:melody_spin/Models/MovieModel.dart';
import 'package:melody_spin/Widgets/MovieCard.dart';
import 'package:number_paginator/number_paginator.dart';

class Search extends StatefulWidget {
  const Search({super.key, required this.query});
final String query;
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<SearchCubit>(context).movieSearch(widget.query, 1);
  }
  final NumberPaginatorController _controller = NumberPaginatorController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit,SearchStates>(builder:(context,state){
 if (state is SearchStates) {
  List<MovieModel> movies=BlocProvider.of<SearchCubit>(context).movies;
  return Scaffold(
    appBar: AppBar(
      leading: IconButton(icon:Icon(Icons.arrow_back_rounded,color: IconColor,) ,onPressed: (){
        Navigator.of(context).pop();
      },),
      backgroundColor: D_mainColor,
    ),
      body: SingleChildScrollView(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [D_mainColor, L_mainColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Column(
                children: [
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: movies.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 35,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) =>movies[index].poster_path!=null&&movies[index].title!=null?MovieCard(Movie: movies[index]):null)
                ],
              ),
            ),
          ),
        ),
      bottomNavigationBar: Material(
        color: D_mainColor,
        child: NumberPaginator(
          numberPages: BlocProvider.of<SearchCubit>(context).NumberOfPage??10,
          onPageChange: (int index) {
            setState(() {
              currentPage = index;
            });
            BlocProvider.of<SearchCubit>(context).movieSearch(widget.query, index+1);
          },
          config: NumberPaginatorUIConfig(
            height: 50,
            buttonSelectedForegroundColor:
                const Color.fromARGB(255, 255, 255, 255),
            buttonUnselectedForegroundColor: Colors.white,
            buttonUnselectedBackgroundColor: Colors.grey,
            buttonSelectedBackgroundColor: IconColor,
          ),
          controller: _controller,
          initialPage: 0,
          showPrevButton: true,
          showNextButton: true,
          nextButtonContent: Icon(Icons.arrow_right_alt),
          prevButtonBuilder: (context) => TextButton(
            onPressed: _controller.currentPage > 0
                ? () => _controller.prev()
                : null, // _controller must be passed to NumberPaginator
            child: Row(
              children: [
                Icon(
                  Icons.chevron_left,
                  color: IconColor,
                ),
                Text(
                  "Previous",
                  style: TextStyle(color: IconColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
 }else{
  return Scaffold();
 }
  });
}}
