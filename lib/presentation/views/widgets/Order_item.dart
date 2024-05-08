import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:stockeep/const.dart';
import 'package:stockeep/core/utils/Gotouter.dart';
import 'package:stockeep/data/models/BCI.dart';

// ignore: must_be_immutable
class Order_item extends StatelessWidget {
   Order_item({
    super.key,
    required this.bci
  });
BCi bci;
int qnt=1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(routerapp.KTrackingview ,extra: bci) ,
      child: Container(
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
        ], borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(FontAwesomeIcons.paste , size: 28 , color: primarycolor,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order N°${bci.id} ',
                  style: GoogleFonts.poppins().copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  bci.date,
                  style: GoogleFonts.poppins()
                      .copyWith(fontSize: 14),
                ),
                SizedBox(
                  height: 18,
                ),
                
              ],
            ) , 
                Icon(FontAwesomeIcons.arrowRight , size: 24, color: primarycolor,)
          ],
        ),
      ),
    );
  }
}
