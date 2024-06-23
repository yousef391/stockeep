import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import 'package:stockeep/const.dart';
import 'package:stockeep/core/utils/Gotouter.dart';
import 'package:stockeep/data/models/BCI.dart';
import 'package:stockeep/presentation/cubit/cubit/addbci_cubit.dart';

import 'package:stockeep/presentation/cubit/cubit/auth_cubit.dart';
import 'package:stockeep/presentation/cubit/cubit/get_bcis_cubit.dart';

// ignore: must_be_immutable
class Order_item extends StatelessWidget {
  Order_item({super.key, required this.bci});
  BCi bci;
  int qnt = 1;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            backgroundColor: const Color(0xFFFF7D7D),
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(18),
                topRight: Radius.circular(18)),
            icon: IconlyLight.delete,
            label: 'Delete',
            onPressed: (BuildContext context) {
              showDialog(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext innercontext) {
                  return BlocProvider.value(
                      value: context.watch<GetBcisCubit>(),
                      child: BlocBuilder<GetBcisCubit, GetBcisState>(
                        builder: (context, state) {
                          return AlertDialog(
                            title: const Text('Warning !'),
                            content: const SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text(
                                    'Are you sure you want to delete this item? This action cannot be undone ',
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancel',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold)),
                              ),
                              TextButton(
                                  onPressed: () {
                                    if (bci.status == 'Created succesfully') {
                                      BlocProvider.of<GetBcisCubit>(context)
                                          .deletedata(
                                              bci,
                                              BlocProvider.of<AuthCubit>(
                                                      context)
                                                  .user!
                                                  .token,
                                              BlocProvider.of<AuthCubit>(
                                                      context)
                                                  .user!
                                                  .id
                                                  .toString());
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  'you cant delete this item because it is not recently created')));
                                    }
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Confirm'))
                            ],
                          );
                        },
                      ));
                },
              );
            },
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () async {
          
          
             GoRouter.of(context).push(routerapp.KTrackingview , extra: bci.id);
             },
            
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
              Icon(
                FontAwesomeIcons.paste,
                size: 28,
                color: primarycolor,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order N°${bci.id} ',
                    style: GoogleFonts.poppins()
                        .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    bci.date,
                    style: GoogleFonts.poppins().copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
              Icon(
                FontAwesomeIcons.arrowRight,
                size: 24,
                color: primarycolor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
