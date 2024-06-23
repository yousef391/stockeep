import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class RadioItem extends StatelessWidget {
  RadioItem({super.key, this.selected = true, required this.text});
  bool selected;
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              height: 18.0,
              width: 18.0,
              decoration: BoxDecoration(
                color: selected ? Colors.blueAccent : Colors.transparent,
                border: Border.all(
                    width: 1.0,
                    color: selected ? Colors.transparent : Colors.grey),
                borderRadius: BorderRadius.circular(100),
              ),
              child: selected
                  ? const Center(
                      child: Icon(
                      FontAwesomeIcons.check,
                      color: Colors.white,
                      size: 10,
                    ))
                  : null),
          Container(
            margin:const EdgeInsets.only(left: 10.0),
            child: Text(
              text,
              style: GoogleFonts.poppins()
                  .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
