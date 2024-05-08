import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stockeep/const.dart';
import 'package:stockeep/data/models/BCI.dart';
import 'package:stockeep/data/models/BCIitem.dart';

import 'package:stockeep/presentation/cubit/cubit/addbci_cubit.dart';

import 'package:stockeep/presentation/cubit/cubit/addproduct_cubit.dart';
import 'package:stockeep/presentation/cubit/cubit/auth_cubit.dart';
import 'package:stockeep/presentation/cubit/cubit/get_bcis_cubit.dart';

import 'package:stockeep/presentation/views/widgets/Carditem.dart';
import 'package:stockeep/presentation/views/widgets/custom_button.dart';
import 'package:stockeep/presentation/views/widgets/customradiolist.dart';

class CardView extends StatefulWidget {
  CardView({super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  String selected = "Decharge";
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      blur: 20,
      progressIndicator: Center(
        child: LoadingAnimationWidget.dotsTriangle(
          color: Color(0xff2185D5),
          size: 80,
        ),
      ),
      inAsyncCall: loading,
      child: BlocBuilder<AddproductCubit, AddproductState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 'Decharge';
                          });
                        },
                        child: RadioItem(
                          selected: selected == 'Decharge',
                          text: 'discharge request',
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 'Supply';
                          });
                        },
                        child: RadioItem(
                          selected: selected == 'Supply',
                          text: 'Supply request',
                        ))
                  ],
                ),
              ),
                 BlocProvider.of<AddproductCubit>(context).CardItems.isNotEmpty ? SliverList.builder(
                    itemCount: BlocProvider.of<AddproductCubit>(context)
                        .CardItems
                        .length,
                    itemBuilder: (context, int index) {
                      return carditem(
                        product: BlocProvider.of<AddproductCubit>(context)
                            .CardItems[index],
                      );
                    }):
               SliverToBoxAdapter(
                    child: Lottie.asset('assets/empty.json')),
           BlocProvider.of<AddproductCubit>(context)
                  .CardItems
                  .isNotEmpty ? SliverToBoxAdapter(
                  child: custom_button(
                ontap: () {
                  List<BCiitem> bCiitems = [];
                  BlocProvider.of<AddproductCubit>(context)
                      .CardItems
                      .forEach((element) {
                    bCiitems.add(BCiitem(
                        name: element.designation,
                        qntaccorde: 0,
                        qntcommande: element.qnt));
                  });

                  BlocProvider.of<AddbciCubit>(context).postdata(BCi(
                      consomid: BlocProvider.of<AuthCubit>(context).user!.id,
                      date: DateTime.now().toString(),
                      status: 'Created succesfully',
                      type: selected,
                      items: bCiitems));
                  BlocProvider.of<GetBcisCubit>(context).getdata(
                      BlocProvider.of<AuthCubit>(context).user!.token,
                      BlocProvider.of<AuthCubit>(context).user!.id.toString());
                },
                content: BlocConsumer<AddbciCubit, AddbciState>(
                  listener: (context, state) {
                    if (state is AddbciSucces) {
                      loading = false;
                    }
                    if (state is Addbciloading) {
                      loading = true;
                    }
                    if (state is Addbcifailure) {
                      loading = false;
                    }
                  },
                  builder: (context, state) {
                    return Text('Confirm Order');
                  },
                ),
                color: Color(0xff2185D5).withOpacity(0.7),
              )) : const SliverToBoxAdapter(child: SizedBox()),
             const SliverToBoxAdapter(
                child: SizedBox(
                  height: 80,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
