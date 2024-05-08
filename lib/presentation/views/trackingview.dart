import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:stockeep/data/models/BCI.dart';

import 'package:stockeep/presentation/views/widgets/CustomStep.dart';

// ignore: must_be_immutable
class Trackingview extends StatelessWidget {
   Trackingview({super.key , required this.bCi});
  BCi bCi;
  int step=1;
  @override
  Widget build(BuildContext context) {
    switch (bCi.status) {
      case 'Created succesfully':step=1;
      case 'Validated by structures manager':step=2;
      case 'Validated by the director':step=3;
      case 'Validated by the storekeeper':step=4;
       case 'Ready for pickup':step=5;
        
        break;
      default:
    }
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Order N°${bCi.id}',
            style: GoogleFonts.poppins()
                .copyWith(fontWeight: FontWeight.bold, fontSize: 19),
          ),
          leading: IconButton(icon : Icon(Icons.arrow_back), onPressed: () { GoRouter.of(context).pop(); },),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                
                children: [
                  Lottie.asset(
                                    'assets/jsonn.json',
                                    fit: BoxFit.fill,
                                    height: MediaQuery.of(context).size.height*0.3
                                    
                                  ),
                  Text(
                    bCi.date,
                    style: GoogleFonts.poppins()
                        .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('${bCi.type} request ',
                      style: GoogleFonts.poppins()
                          .copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        stepp(
                          title: 'Created succesfully',
                          selected: step >=  1 ,
                        ),
                        stepp(
                          title: 'Validated by structures manager',
                          selected: step >=  2 ,
                        ),
                        stepp(
                          title: 'Validated by the director',
                          selected: step>=  3 ,
                        ),
                        stepp(
                          title: 'Validated by the storekeeper',
                          selected: step >=  4 ,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
              
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      strokeAlign: BorderSide.strokeAlignInside,
                                      color: step ==5 ? Colors.green : Colors.grey)),
                              child: CircleAvatar(
                                radius: MediaQuery.of(context).size.width * 0.045,
                                backgroundColor: step ==5 ? Colors.green : Colors.grey,
                              ),
                            ),
                            Text("Ready for pickup",
                                style: TextStyle(fontWeight: FontWeight.w500))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}



