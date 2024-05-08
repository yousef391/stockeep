import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:stockeep/const.dart';
import 'package:stockeep/data/models/Product.dart';
import 'package:stockeep/presentation/cubit/cubit/addproduct_cubit.dart';

class carditem extends StatelessWidget {
   carditem({
    super.key,
    required this.product,
    
  });
  void Function()?  add;
  void Function()? remove;
Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Slidable(
        
        endActionPane:  ActionPane(
      motion: const StretchMotion(),
      children: [
        SlidableAction(
          backgroundColor: Color(0xFFFF7D7D),
          borderRadius:  BorderRadius.only(bottomRight: Radius.circular(18) , topRight: Radius.circular(18)  ) ,
          icon: IconlyLight.delete,
          label: 'Delete', onPressed: (BuildContext context) { 
            product.qnt=0;
            BlocProvider.of<AddproductCubit>(context).removeallproducts(product);
             },
        ),
       
      ],
        ),
        child: Container(
        
          padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 3),
          height: 120,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ], borderRadius: BorderRadius.circular(12), color: cardbg),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                right: 5,
                child: SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.085,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors
                              .white, // You can change the background color of the circle
                          child: IconButton(
                            icon: Icon(
                              FontAwesomeIcons.minus,
                              size: 16,
                              color: Colors.grey,
                            ),
                            onPressed: (){
                               BlocProvider.of<AddproductCubit>(context).removeproduct(product);
                            }
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Text(
                          '${product.qnt}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.085,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors
                              .white, // You can change the background color of the circle
                          child: IconButton(
                            icon: Icon(
                              FontAwesomeIcons.plus,
                              size: 16,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                               BlocProvider.of<AddproductCubit>(context).addproduct(product);
                            }
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/product.png',
                    height: 105,
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            product.designation ,
                            style: GoogleFonts.poppins().copyWith(
                              
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'product.articles.first ',
                            style: GoogleFonts.poppins()
                                .copyWith(fontSize: 13),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Text('Quantity : ${product.qnt}',
                              style: GoogleFonts.poppins().copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
