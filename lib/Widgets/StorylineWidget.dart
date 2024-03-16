import 'package:flutter/material.dart';
import 'package:melody_spin/Constants/Constants_Color.dart';
import 'package:readmore/readmore.dart';

class StorylineWidget extends StatelessWidget {
  final String StorylineText;
  const StorylineWidget({
    super.key,
    required this.StorylineText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Story line",
            style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontFamily: "raleway",
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 15,
          ),
          ReadMoreText(
            StorylineText,
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontFamily: "raleway"),
            trimLength: 180,
            colorClickableText: IconColor,
          )
        ],
      ),
    );
  }
}
