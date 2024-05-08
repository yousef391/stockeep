import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stockeep/const.dart';
import 'package:stockeep/presentation/cubit/cubit/auth_cubit.dart';
import 'package:stockeep/presentation/cubit/cubit/getproducts_cubit.dart';

class custom_searchbar extends StatelessWidget {
  const custom_searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        
        BlocProvider.of<GetproductsCubit>(context).getproductsbyfirstletters(BlocProvider.of<AuthCubit>(context).user!.token, value );
      },
                decoration: InputDecoration(
                    focusedBorder: searchbarborder(),
                    disabledBorder: searchbarborder(),
                    enabledBorder: searchbarborder(),
                    border: searchbarborder(),
                    hintText: "Search...",
                    hintStyle: TextStyle(color: primarycolor ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: primarycolor,
                        size: 18,
                      ),
                    ),
                    fillColor: Color(0xffF7FAFC),
                    filled: true),
              );
  }
}

  OutlineInputBorder searchbarborder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.transparent));
  }