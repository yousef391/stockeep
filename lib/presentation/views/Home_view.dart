import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:stockeep/presentation/views/widgets/Product_item.dart';
import 'package:stockeep/presentation/views/widgets/custom_dropdownbutton.dart';
import 'package:stockeep/presentation/views/widgets/custom_searchbar.dart';
import 'package:stockeep/presentation/views/widgets/custombuttombar.dart';

import 'widgets/custom_appbar.dart';

class Home_view extends StatefulWidget {
  Home_view({super.key});

  @override
  State<Home_view> createState() => _Home_viewState();
}

class _Home_viewState extends State<Home_view> {
  List<String>? items = ['yousef', 'islem', 'achraf'];

  List<String?> selectedvalue = [];
  List<String?> selectedvalue2 = [];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const custom_appBar(),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: custom_searchbar(),
                            ),
                            Text(
                              'Filtres',
                              style:
                                  GoogleFonts.poppins().copyWith(fontSize: 18),
                              textAlign: TextAlign.start,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: custom_dropdownbutton(
                                      hint: 'Chapter..',
                                      items: items!,
                                      onchange: (value) {
                                        setState(() {
                                          selectedvalue = value;
                                        });
                                      },
                                      selectedvalue: selectedvalue,
                                      icon: FontAwesomeIcons.chartBar,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: custom_dropdownbutton(
                                      hint: 'Article..',
                                      items: items!,
                                      onchange: (value) {
                                        setState(() {
                                          selectedvalue2 = value;
                                        });
                                      },
                                      selectedvalue: selectedvalue,
                                      icon: FontAwesomeIcons.noteSticky,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Products',
                              style:
                                  GoogleFonts.poppins().copyWith(fontSize: 18),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 5,
                              childAspectRatio: 0.92),
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) {
                        // Your grid item builder function
                        return productitem();
                      },
                    )
                  ],
                ),
              ),
              custombottombar(
                onselect: (int index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                selectedIndex: selectedIndex,
              ),
            ],
          ),
        ));
  }
}
