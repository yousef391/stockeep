

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class custom_button extends StatelessWidget {
  custom_button(
      {super.key, required this.color, required this.content, this.ontap});
  Color color;

  Widget? content;
  void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ontap,
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(6)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(child: content),
          ),
        ));
  }
}
