import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:stockeep/const.dart';
import 'package:stockeep/data/models/Product.dart';
import 'package:stockeep/presentation/cubit/cubit/addproduct_cubit.dart';

// ignore: must_be_immutable
class productitem extends StatelessWidget {
   productitem({
    required this.product,
    super.key,
  });
Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffF3F3F3), borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: (){

BlocProvider.of<AddproductCubit>(context).addproduct(product);

  showDialog(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext innercontext) {
      return const AlertDialog(
        
        titleTextStyle: TextStyle(color: Colors.greenAccent , fontWeight: FontWeight.bold ),
        title:  Text('Success'),
        content:  SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('the item has been added' ,style:TextStyle( fontSize: 12),)
            ],
          ),
        ),
        actions: <Widget>[
           
       
          
        ],
      );
    },
  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                  decoration: BoxDecoration(
                      color: buttoncolor,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(12),
                          topLeft: Radius.circular(12))),
                  child: Icon(
                    FontAwesomeIcons.plus,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset('assets/images/product.png'),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    product.designation,
                                              overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                    style: GoogleFonts.poppins().copyWith(fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Disponible',
                    style: GoogleFonts.poppins()
                        .copyWith(fontSize: 13, fontWeight: FontWeight.bold, ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
