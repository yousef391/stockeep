import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import 'package:shimmer/shimmer.dart';
import 'package:stockeep/presentation/cubit/cubit/auth_cubit.dart';
import 'package:stockeep/presentation/cubit/cubit/getarticles_cubit.dart';
import 'package:stockeep/presentation/cubit/cubit/getproducts_cubit.dart';
import 'package:stockeep/presentation/cubit/cubit/home_cubit.dart';
import 'package:stockeep/presentation/views/widgets/Product_item.dart';
import 'package:stockeep/presentation/views/widgets/custom_dropdownbutton.dart';
import 'package:stockeep/presentation/views/widgets/custom_searchbar.dart';
import 'package:stockeep/presentation/views/widgets/skelton.dart';

class Home_body extends StatefulWidget {
  const Home_body({super.key});

  @override
  State<Home_body> createState() => _Home_bodyState();
}

class _Home_bodyState extends State<Home_body> {
  List<String?> selectearticles = [];
  List<String?> selectedchapitres = [];
  List<String> chapitres = [];
  List<String> articles = [];
  List<int> articles_ids = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetchapitreCubit, GetchapitreState>(
  
      listener: (context, state) {
        if (state is GetchapitreFailure) {
          QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: state.message,
              confirmBtnText: 'Ok',
              confirmBtnColor: Color(0xff2185D5),
              borderRadius: 8);
        }
      },
      builder: (context, state) {
        if (state is GetchapitreSuccess) {
          chapitres = state.chaplist.keys.toList();
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: custom_searchbar(),
                    ),
                    Text(
                      'Filtres',
                      style: GoogleFonts.poppins().copyWith(fontSize: 18),
                      textAlign: TextAlign.start,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: custom_dropdownbutton(
                              onchange: ()  {
                                
                                List<int> chap_ids = [];
                                selectearticles=[];
                                state.chaplist.forEach((key, value) {
                                  if (selectedchapitres.contains('$key')) {
                                    chap_ids.add(value);
                                  }
                                });
                
                                BlocProvider.of<GetarticlesCubit>(context)
                                    .getdata( BlocProvider.of<AuthCubit>(context).user!.token , chap_ids);
                              },
                              hint: 'Chapter..',
                              items: state.chaplist.keys.toList(),
                              selectedvalue: selectedchapitres,
                              icon: FontAwesomeIcons.chartBar,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: BlocConsumer<GetarticlesCubit,
                                GetarticlesState>(
                              listener: (BuildContext context,
                                  GetarticlesState articlesstate) {
                                if (articlesstate is GetarticlesSuccess) {
                                  articles_ids = [];
                                  articles = [];
                                  articlesstate.articleslist
                                      .forEach((key, value) {
                                    articles.add(value.designation);
                                    articles_ids.add(key);
                                  });
                                }
                              },
                              builder: (context, articlesstate) {
                                if (articlesstate is Getarticlesloading ||
                                    articlesstate is GetarticlesFailure) {
                                  return Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    enabled: true,
                                    child: Container(
                                      height: 40,
                                      width: 140,
                                      color: Colors.grey,
                                    ),
                                  );
                                } else {
                                  return custom_dropdownbutton(
                                    onchange: () {
                                    
                                      BlocProvider.of<GetproductsCubit>(
                                              context)
                                          .getdata(BlocProvider.of<AuthCubit>(context).user!.token , articles_ids);
                                    },
                                    hint: 'Article..',
                                    items: articles,
                                    selectedvalue: selectearticles,
                                    icon: FontAwesomeIcons.noteSticky,
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Products',
                      style: GoogleFonts.poppins().copyWith(fontSize: 18),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
                child: BlocConsumer<GetproductsCubit, GetproductsState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, productsstate) {
                    if (productsstate is GetproductsSuccess) {
                      return GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 5,
                                childAspectRatio: 0.92),
                        itemCount: productsstate.productslist.length,
                        itemBuilder: (BuildContext context, int index) {
                          // Your grid item builder function
                          return productitem(
                            product:
                                productsstate.productslist[index],
                          );
                        },
                      );
                    } else {
                      return Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    enabled: true,
                        child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 8
                              ),
                              itemCount: 6,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16) , color:  Colors.grey,),
                                  height:90 ) ;
                              },
                            ),
                      );
                    }
                  },
                ),
              )
            ],
          );
        } else {
          return shimmer();
        }
      },
    );
  }
}
