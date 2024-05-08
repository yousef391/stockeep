import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class customuserinfotail extends StatelessWidget {
  customuserinfotail({
    super.key,
    required this.img , 
    required this.subtitle , 
    required this.title
  });
String title;
String subtitle;
String img;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.poppins().copyWith(fontSize: 16 , fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.poppins().copyWith(fontSize: 12 , color: Colors.grey),
      ),
      leading: Container(
        height: 52,
        width: 52,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Image.network(
          img,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}