import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';


class shimmer extends StatelessWidget {
  const shimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child:  SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: SafeArea(
                      child: 
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10 ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15,),
                            // Custom app bar skeleton
                            Container(
                              width: double.infinity,
                              height: 50,
                              color: Colors.grey[300],
                              // Custom AppBar Skeleton
                            ),
                            // Custom search bar skeleton
                            SizedBox(
                              height: 24,
                            ),
                            // "Filtres" text skeleton
                            Container(
                              width: 100,
                              height: 20,
                              color: Colors.grey[300],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            // Row with custom dropdown buttons skeleton
                            IntrinsicHeight(
                              child: Container(
                                     child: Row(
                                       children: [
                                         Expanded(
                                           child: Container(
                                             height: 40,
                                             color: Colors.grey[300],
                                             // Custom DropdownButton skeleton
                                           ),
                                         ),
                                         SizedBox(
                                           width: 10,
                                         ),
                                         Expanded(
                                           child: Container(
                                             height: 40,
                                             color: Colors.grey[300],
                                             // Custom DropdownButton skeleton
                                           ),
                                         ),
                                       ],
                                     ),
                              ),
                            ),
                            // "Products" text skeleton
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 100,
                              height: 20,
                              color: Colors.grey[300],
                            ),
SizedBox(height: 20,),
                            GridView.builder(
                              shrinkWrap: true,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 8
                              ),
                              itemCount: 6,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(height:90 , decoration: BoxDecoration(borderRadius: BorderRadius.circular(16) ,color:  Colors.grey,),) ;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
          ))
;
  }
}