import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Cardshimmer extends StatelessWidget {
  const Cardshimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
   child : Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 3),
        height: 100,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ], borderRadius: BorderRadius.circular(12), color: Colors.white),));
  }
}