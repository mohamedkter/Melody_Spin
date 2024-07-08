import 'package:flutter/material.dart';
import 'package:melody_spin/Screens/Search.dart';

class CustomSearchWidget extends StatefulWidget {
   const CustomSearchWidget({
    super.key,
  });

  @override
  State<CustomSearchWidget> createState() => _CustomSearchWidgetState();
}

class _CustomSearchWidgetState extends State<CustomSearchWidget> {
TextEditingController query=TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Welcome",
            style: TextStyle(
                fontFamily: "raleway",
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text("Enjoy your favorite Movies",
              style: TextStyle(
                  fontFamily: "raleway",
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: query,
            style: const TextStyle(
                fontFamily: "raleway",
                fontSize: 15,
                fontWeight: FontWeight.w700),
            decoration: InputDecoration(
                prefixIcon: IconButton(icon:  Icon(Icons.search_rounded),onPressed: (){
                  if(query.text!=""){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Search(query: query.text,)));
                  }
                },),
                hintText: "Search",
                hintStyle: const TextStyle(
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
